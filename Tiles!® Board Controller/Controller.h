//
//  Controller.h
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bluetooth.h"
#import "Game.h"


@interface Controller : NSObject <BluetoothDelegate>

@property Bluetooth* bleManager;
@property Game* game;
@property BOOL isConnectedToBluno;
@property Device* connectedDevice;

@end
