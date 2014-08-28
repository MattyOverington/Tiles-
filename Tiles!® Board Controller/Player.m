//
//  PLayer.m
//  Tiles!® Board Controller
//
//  Created by Matthew Overington and Tom Copcutt on 8/19/14.
//  Copyright (c) 2014 The Traditional Game Company. All rights reserved.
//

#import "Player.h"

@implementation Player

- (id)init {
    self = [super init];
    self.name = @"default_name";
    self.piecesOwned = [[NSMutableArray alloc] init];
    
    return self;
}

- (void)assignName:(NSString *)name {
    self.name = name;
}



@end
