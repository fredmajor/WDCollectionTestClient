//
//  WDDataset.h
//  WDCollectionTestClient
//
//  Created by Fred on 05/04/15.
//  Copyright (c) 2015 wdf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDDataset : NSObject

@property (nonatomic, strong) NSString *datasetKey;
@property (nonatomic, strong) NSMutableArray* dataItems;
@property (nonatomic) NSUInteger itemsReported;

@end
