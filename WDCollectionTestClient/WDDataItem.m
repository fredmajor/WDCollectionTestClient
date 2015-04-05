//
//  WDDataItem.m
//  WDCollectionTestClient
//
//  Created by Fred on 05/04/15.
//  Copyright (c) 2015 wdf. All rights reserved.
//

#import "WDDataItem.h"

@implementation WDDataItem

@synthesize imagePath;
@synthesize editableBool;
@synthesize editableString;
@synthesize constanteString;

- (NSString *)debugDescription{
    return [NSString stringWithFormat:@"<%@: %p> %@", [self class], self, self.imagePath];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"imPath=%@", self.imagePath];
}

@end
