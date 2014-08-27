//
//  Device.m
//  Tiles!® Board Controller
//
//  Created by Matthew Overington on 8/19/14.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//
#import "Device.h"


@implementation Device


- (id)init
{
	self = [super init];
	if (self) {
		self.peripheral = nil;
		self.readyToWrite = NO;
	}
	return self;
}


@end
