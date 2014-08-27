//
//  Bluetooth.h
//  Tiles!® Board Controller
//
//  Created by Matthew Overington on 8/19/14.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "Device.h"
#import "Colour.h"


@protocol BluetoothDelegate <NSObject>

@optional

- (void)bluetoothIsReadyWithSupport:(BOOL)support;

- (void)didDiscoverDevice:(Device *)device;

- (void)didConnectToDevice:(Device *)device;
- (void)didDisconnectFromDevice:(Device *)device;

- (void)didSendData:(NSData *)message toDevice:(Device *)device;
- (void)didReceiveData:(NSData *)message fromDevice:(Device *)device;

@end


@interface Bluetooth : NSObject <CBCentralManagerDelegate, CBPeripheralDelegate>

@property (nonatomic, weak) id<BluetoothDelegate> delegate;

+ (Bluetooth *)shared;

- (void)connectToDevice:(Device *)device;
- (void)disconnectFromDevice:(Device *)device;

- (void)sendMessage:(NSString *)message toDevice:(Device *)device;
- (void)sendData:(NSData *)data toDevice:(Device *)device;
- (void)sendDataWithColour:(Colour *)colour toDevice:(Device *)device;

- (void)beginScanning;
- (void)stopScanning;

-(BOOL) compareCBUUID:(CBUUID *) UUID1 UUID2:(CBUUID *)UUID2;

@end