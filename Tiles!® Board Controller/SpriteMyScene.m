//
//  SpriteMyScene.m
//  TowerDefense
//
//  Created by Tom Copcutt on 6/16/14.
//  Copyright (c) 2014 Tom Copcutt. All rights reserved.
//

#import "SpriteMyScene.h"

@interface SpriteMyScene () <SKPhysicsContactDelegate>
@property (nonatomic) iPadBoard*grid;
@property id game;
@end


@implementation SpriteMyScene
-(iPadBoard *)grid {
    if (!_grid) {
        _grid = [[iPadBoard alloc]init];
    }
    return _grid;
}



-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.game = [[PianoTile alloc]init];
                self.physicsWorld.contactDelegate = self;
        
    }
    return self;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for  (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        NSInteger xlineNumber = MAX_GRID_X * location.x / (float) (CGRectGetWidth(self.frame)-8);
        NSInteger ylineNumber = MAX_GRID_Y * location.y / (float) CGRectGetHeight(self.frame);
        
        float xValue = CGRectGetMinX(self.frame) + xlineNumber / (float) MAX_GRID_X * (CGRectGetWidth(self.frame)-8) + 20;
        float yValue = CGRectGetMinY(self.frame) + ylineNumber  / (float) MAX_GRID_Y * CGRectGetHeight(self.frame) + 20;
        
        iPadTile* touchedSquare = [self.grid tileWithPosition:CGPointMake(xValue, yValue)];
            //run a method in the game which decides what to do
        [self.game touchAtSquare:touchedSquare];
        }
    }



-(void)update:(CFTimeInterval)currentTime {
    if ( fmod(currentTime, 5.0) < 0.03) {
        
    }
    
}


- (void)didBeginContact:(SKPhysicsContact *)contact {
    }
@end
