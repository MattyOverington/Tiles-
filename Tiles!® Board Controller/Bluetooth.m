//
//  Bluetooth.m
//  Tiles!® Board Controller
//
//  Created by Matthew Overington on 8/19/14.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import "Bluetooth.h"


#define BLUNO_SERVICE_UUID @"dfb0"
#define BLUNO_CHARACTERISTIC_UUID @"dfb1"


@interface Bluetooth ()

@property CBCentralManager *manager;

@property NSMutableDictionary *devices;
@property BOOL supported;

@end


@implementation Bluetooth

- (BOOL) compareCBUUID:(CBUUID *) UUID1 UUID2:(CBUUID *)UUID2
{
    char b1[16];
    char b2[16];
    [UUID1.data getBytes:b1];
    [UUID2.data getBytes:b2];
    
    if (memcmp(b1, b2, UUID1.data.length) == 0)
        return TRUE;
    else
        return FALSE;
}


- (id)init
{
	self = [super init];
	if (self) {
		self.supported = NO;
		self.manager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
		self.devices = [[NSMutableDictionary alloc] init];
	}
	return self;
}


+ (Bluetooth *)shared
{
	static Bluetooth *instance = NULL;
	
	if (!instance) {
		instance = [[Bluetooth alloc] init];
	}
	
	return instance;
}


- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
	if (central.state == CBCentralManagerStatePoweredOn) {
		self.supported = YES;
	}
	
	if ([self.delegate respondsToSelector:@selector(bluetoothIsReadyWithSupport:)]) {
		[self.delegate bluetoothIsReadyWithSupport:self.supported];
	}
}



#pragma mark - Peripheral Scanning


- (void)beginScanning
{
	[self.manager stopScan];
	if (self.supported) {
		[self.manager scanForPeripheralsWithServices:@[[CBUUID UUIDWithString:BLUNO_SERVICE_UUID]] options:nil];
	}
}


- (void)stopScanning
{
	[self.manager stopScan];
}



#pragma mark - Peripheral Discovery


- (void)centralManager:(CBCentralManager *)central
 didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary *)advertisementData
                  RSSI:(NSNumber *)RSSI
{
	Device *device = [self.devices objectForKey:peripheral.identifier.UUIDString];
	if (!device) {
		device = [[Device alloc] init];
		[self.devices setObject:device forKey:peripheral.identifier.UUIDString];
	}
	
	device.peripheral = peripheral;
	if ([self.delegate respondsToSelector:@selector(didDiscoverDevice:)]) {
		[self.delegate didDiscoverDevice:device];
	}
}



#pragma mark - Peripheral Connection


- (void)connectToDevice:(Device *)device
{
	assert(device);
	assert(device.peripheral);
	
	[self.manager connectPeripheral:device.peripheral options:nil];
}


- (void)disconnectFromDevice:(Device *)device
{
	assert(device);
	assert(device.peripheral);
	
    
    
	CBCharacteristic *characteristic = nil;
	
	for (CBService *service in device.peripheral.services) {
		if ([self compareCBUUID:service.UUID UUID2:(CBUUID*)BLUNO_SERVICE_UUID]) {
			for (CBCharacteristic *c in service.characteristics) {
				if ([self compareCBUUID:c.UUID UUID2:(CBUUID *)BLUNO_CHARACTERISTIC_UUID]) {
					characteristic = c;
					break;
				}
			}
			
			break;
		}
	}
	
	[device.peripheral setNotifyValue:NO forCharacteristic:characteristic];
	[self.manager cancelPeripheralConnection:device.peripheral];
}


- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
	peripheral.delegate = self;
	[peripheral discoverServices:nil];
}


- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral
                 error:(NSError *)error
{
	Device *device = [self.devices objectForKey:peripheral.identifier.UUIDString];
	
	if ([self.delegate respondsToSelector:@selector(didDisconnectFromDevice:)]) {
		[self.delegate didDisconnectFromDevice:device];
	}
	
	[self.devices removeObjectForKey:peripheral.identifier.UUIDString];
}



#pragma mark - Peripheral Communication


- (void)sendMessage:(NSString *)message toDevice:(Device *)device
{
	assert(message);
	
	[self sendData:[message dataUsingEncoding:NSUTF8StringEncoding] toDevice:device];
}


- (void)sendData:(NSData *)data toDevice:(Device *)device
{
	assert(data);
	assert(device);
	assert(device.peripheral);
	
	if (self.supported && device.readyToWrite) {
		CBCharacteristic *characteristic = nil;
		
		// Find the correct characteristic
		for (CBService *service in device.peripheral.services) {
			if ([self compareCBUUID:service.UUID UUID2:(CBUUID*)BLUNO_SERVICE_UUID]) {
				for (CBCharacteristic *c in service.characteristics) {
					if ([self compareCBUUID:c.UUID UUID2:(CBUUID *)BLUNO_CHARACTERISTIC_UUID]) {
						characteristic = c;
						break;
					}
				}
				
				break;
			}
		}
		
		// Write the data
		if (characteristic) {
			[device.peripheral writeValue:data forCharacteristic:characteristic type:CBCharacteristicWriteWithResponse];
		}
	}
}

- (void)sendDataWithColour:(Colour *)colour toDevice:(Device *)device {
    assert(colour);
	assert(device);
	assert(device.peripheral);
	
	if (self.supported && device.readyToWrite) {
		CBCharacteristic *characteristic = nil;
		
		// Find the correct characteristic
		for (CBService *service in device.peripheral.services) {
			if ([self compareCBUUID:service.UUID UUID2:(CBUUID*)BLUNO_SERVICE_UUID]) {
				for (CBCharacteristic *c in service.characteristics) {
					if ([self compareCBUUID:c.UUID UUID2:(CBUUID *)BLUNO_CHARACTERISTIC_UUID]) {
						characteristic = c;
						break;
					}
				}
				
				break;
			}
		}
		
        //Convert colour into data
        u_int8_t Colours[] = {0x00, 0x00, 0x00};
        
        Colours[0] = (u_int8_t)colour.red;
        Colours[1] = (u_int8_t)colour.green;
        Colours[2] = (u_int8_t)colour.blue;
        
        NSData* data = [[NSData alloc] initWithBytes:Colours length:3];
        
		// Write the data
		if (characteristic) {
			[device.peripheral writeValue:data forCharacteristic:characteristic type:CBCharacteristicWriteWithResponse];
		}
	}
}


- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
	for (CBService *service in peripheral.services) {
		[peripheral discoverCharacteristics:nil forService:service];
	}
}


- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service
             error:(NSError *)error
{
	// Complete setup before finally telling the delegate we have fully connected to the device
	
	if ([self compareCBUUID:service.UUID UUID2:(CBUUID*)BLUNO_SERVICE_UUID]) {
		for (CBCharacteristic *characteristic in service.characteristics) {
			if ([self compareCBUUID:characteristic.UUID UUID2:(CBUUID *)BLUNO_CHARACTERISTIC_UUID]) {
				[peripheral setNotifyValue:YES forCharacteristic:characteristic];
			}
		}
		
		Device *device = [self.devices objectForKey:peripheral.identifier.UUIDString];
		device.readyToWrite = YES;
		
		if ([self.delegate respondsToSelector:@selector(didConnectToDevice:)]) {
			[self.delegate didConnectToDevice:device];
		}
	}
}


- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic
             error:(NSError *)error
{
	// Called when the Arduino sends something
	
	if ([self.delegate respondsToSelector:@selector(didReceiveData:fromDevice:)]) {
		Device *device = [self.devices objectForKey:peripheral.identifier.UUIDString];
		[self.delegate didReceiveData:characteristic.value fromDevice:device];
	}
}


- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic
             error:(NSError *)error
{
	// Called after we send something
	
	if ([self.delegate respondsToSelector:@selector(didSendData:toDevice:)]) {
		Device *device = [self.devices objectForKey:peripheral.identifier.UUIDString];
		[self.delegate didSendData:characteristic.value toDevice:device];
	}
}


@end