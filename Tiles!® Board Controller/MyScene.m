//
//  MyScene.m
//  Tiles!® Board Controller
//
//  Created by Tom Copcutt on 9/22/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "MyScene.h"

@interface MyScene () <SKPhysicsContactDelegate>
@property (nonatomic) iPadBoard*grid;
@property (nonatomic)  NSMutableArray* lights;
@end


@implementation MyScene
-(iPadBoard *)grid {
    if (!_grid) {
        _grid = [[iPadBoard alloc]initWithWidth:8 height:8];
    }
    return _grid;
}
-(NSMutableArray*)lights {
    if(!_lights) {
        _lights = [[NSMutableArray alloc]init];
        
    }
    return _lights;
}


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        
        // self.physicsWorld.contactDelegate = self;
        for (NSInteger i = 0; i < self.grid.height; i++) {
            //NSMutableArray*row = [[NSMutableArray alloc]init];
            for (NSInteger j = 0; j < self.grid.width; j++) {
                
                CGSize size = CGSizeMake(CGRectGetWidth(self.frame)/self.grid.width, CGRectGetHeight(self.frame)/self.grid.height);
                
                CGPoint position = CGPointMake(CGRectGetWidth(self.frame)/self.grid.width*j+size.width/2.0f, CGRectGetHeight(self.frame)/self.grid.height*i+size.height/2.0f);
                
                float num1 = arc4random_uniform(255)/255.0f;
                float num2 = arc4random_uniform(255)/255.0f;
                float num3 = arc4random_uniform(255)/255.0f;
                
                UIColor* colour = [UIColor colorWithRed:0 green:num2 blue:num3 alpha:1];
                
                SKSpriteNode* rect = [[SKSpriteNode alloc]initWithColor:colour size:size];
                rect.position = position;
                rect.name = [NSString stringWithFormat:@"%d,%d", j,i];
                [self addChild:rect];
                //[row addObject:rect];
                
                
                
            }
            //[self.lights addObject:row];
        }
    }
    return self;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for  (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        NSInteger xlineNumber = MAX_GRID_X * location.x / (float) (CGRectGetWidth(self.frame)-8);
        NSInteger ylineNumber = MAX_GRID_Y * location.y / (float) CGRectGetHeight(self.frame);
        //run a method in the game which decides what to do
        [self.grid test];
        [self.grid touchFromArduinoX:xlineNumber Y:ylineNumber];
    }
}



-(void)update:(CFTimeInterval)currentTime {
    [self.grid update:currentTime];
    for (NSInteger i = 0; i < self.grid.height; i++) {
        for (NSInteger j = 0; j < self.grid.width; j++) {
           SKSpriteNode* node = [self childNodeWithName:[NSString stringWithFormat:@"%d,%d", j, i]];
            iPadTile* tile = [self.grid tileWithX:j Y:i];
            Colour *colour =  tile.tileColour;
            node.color = [[UIColor alloc]initWithRed:colour.red/255.0f green:colour.green/255.0f blue:colour.blue/255.0f alpha:1];
            
            
   
        }
    }
}


- (void)didBeginContact:(SKPhysicsContact *)contact {
}
@end
