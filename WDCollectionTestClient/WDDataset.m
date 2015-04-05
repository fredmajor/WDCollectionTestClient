//
//  WDDataset.m
//  WDCollectionTestClient
//
//  Created by Fred on 05/04/15.
//  Copyright (c) 2015 wdf. All rights reserved.
//

#import "WDDataset.h"

@implementation WDDataset

@synthesize dataItems;
@synthesize datasetKey;
@synthesize itemsReported;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataItems = [NSMutableArray array];
    }
    return self;
}


@end
