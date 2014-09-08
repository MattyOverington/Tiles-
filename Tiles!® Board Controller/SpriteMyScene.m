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
        SKSpriteNode *sn = [SKSpriteNode spriteNodeWithImageNamed:@"TowerDefenceBGI.jpg"];
        sn.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        sn.size = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        sn.name = @"BACKGROUND";
        [self addChild:sn];

        SKSpriteNode *cancelSign = [SKSpriteNode spriteNodeWithImageNamed:@"cancel_sign_bright.png"];
        cancelSign.position = [self.grid tileWithPosition:CGPointMake(20, 20)].position;
        [self.grid squareWithPosition:CGPointMake(20, 20)].isFree = NO;
        cancelSign.size = CGSizeMake(40, 40);
        cancelSign.alpha = 0.5;
        [self addChild:cancelSign];
        self.cancelSignIndex = [self.children indexOfObject:cancelSign];
        
        self.physicsWorld.contactDelegate = self;
        //spawn tower in all positions
        /*
        for (GridSquare*square in self.grid.allGridSquares) {
            if (square.isFree) {
                Tower*tower = [[Tower alloc]init];
                tower.size = CGSizeMake(40, 40);
                tower.position = CGPointMake(square.position.x, square.position.y);
                [self.allTowers.allTowers addObject:tower];
                [self addChild:tower];
                square.isFree = NO;
            }
        }*/
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
        
        GridSquare* touchedSquare = [self.grid squareWithPosition:CGPointMake(xValue, yValue)];
        
        if (CGPointEqualToPoint(touchedSquare.position,CGPointMake(20, 20))) {
            SKSpriteNode* cancelSign = [self.children objectAtIndex:self.cancelSignIndex];
            if (self.deleteToolActive == NO) {
                self.deleteToolActive = YES;
                cancelSign.alpha = 1;
            } else {
                self.deleteToolActive = NO;
                cancelSign.alpha = 0.5;
            }
        } else {
            if (self.deleteToolActive == NO ) {
                if (touchedSquare.isFree) {
                    Tower*tower = [[Tower alloc]init];
                    tower.size = CGSizeMake(40, 40);
                    tower.position = CGPointMake(xValue, yValue);
                    [self.allTowers.allTowers addObject:tower];
                    [self addChild:tower];
                    touchedSquare.isFree = NO;
                }
            } else {
                Tower*p = [self.allTowers towerWithPosition:touchedSquare.position];
                if (p != nil) {
                    [self.allTowers.allTowers removeObjectIdenticalTo:p];
                    [self removeChildrenInArray:@[p]];
                    touchedSquare.isFree = YES;
                }
            }
        }
    }
}


-(void)update:(CFTimeInterval)currentTime {
    if ( fmod(currentTime, 5.0) < 0.03) {
        Enemy* newEnemy = [[Enemy alloc]init];
        [newEnemy moveEnemy];
        [self addChild:newEnemy];
    }
    for (Enemy*enemy in self.enemies) {
        if (enemy.isDead == YES) {
            [self.enemies removeObjectIdenticalTo:enemy];
        }
    }
    for (Tower* tower in self.allTowers.allTowers) {
        [tower update:currentTime];
        if([tower willShootAProjectile]) {
            BOOL willShoot = NO;
            for (Enemy*testenemy in self.enemies) {
                CGFloat diffX = fabsf(testenemy.position.x - tower.position.x);
                CGFloat diffY = fabsf(testenemy.position.y - tower.position.y);
                CGFloat dist = pow(diffX,2) + pow(diffY,2);
                if (dist <= 50000) {
                    willShoot = YES;
                }
            }
            if (willShoot == YES) {
                [tower projectileHasBeenShot];
                Projectile *projectile = [[Projectile alloc]initFromUnit:tower power:tower.projectileSpeed angle:arc4random_uniform(360)/M_PI];
                projectile.position = tower.position;
                [self addChild:projectile];
            }
        }
    }
}


- (void)didBeginContact:(SKPhysicsContact *)contact {
    SKPhysicsBody *firstBody, *secondBody;
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    } else {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    } if (firstBody.categoryBitMask == PhysicsBodyCategoryEnemy) {
        [(Enemy*)firstBody.node hitBy:(Projectile*)secondBody.node];
    }
}
@end
