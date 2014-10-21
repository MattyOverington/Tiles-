//
//  Controller.m
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
//

#import "Controller.h"

#define BLUNO_SERVICE_UUID @"dfb0"
#define BLUNO_CHARACTERISTIC_UUID @"dfb1"

@interface Controller ()

@end



@implementation Controller

- (id)init {
    self.bleManager = [[Bluetooth alloc] init];
    
    return self;
    
}

- (void)didDiscoverDevice:(Device *)device {
    [self.bleManager connectToDevice:device];
}

- (void)didConnectToDevice:(Device *)device {
    self.isConnectedToBluno = TRUE;
    self.connectedDevice = device;
}

@end
