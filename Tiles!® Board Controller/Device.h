//
//  Device.m
//  Tiles!® Board Controller
//
//  Created by Matthew Overington on 8/19/14.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>


@interface Device : NSObject

@property CBPeripheral *peripheral;
@property BOOL readyToWrite;

@end