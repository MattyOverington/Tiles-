
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
    self.game = [[Game alloc] init];
    return self;
    
}

- (void)didDiscoverDevice:(Device *)device {
    [self.bleManager connectToDevice:device];
}

- (void)didConnectToDevice:(Device *)device {
    self.isConnectedToBluno = TRUE;
    self.connectedDevice = device;
    [self.game runGame];
}

- (void)sendBoardData {
    for (int i = 0; i < 8; i ++) {
        for (int j = 0; j < 8; j++) {
            Tile* t = [[self.game.gameBoard.allTiles objectAtIndex:i] objectAtIndex:j];
            [self.bleManager sendDataWithColour:t.tileColour toDevice:self.connectedDevice withX:i andY:j];
        }
    }
}

-(void)renderBoard {
    [self sendBoardData];
}

- (void)didReceiveData:(NSData *)message fromDevice:(Device *)device {
    
}

@end
