//
//  WDDataItem.h
//  WDCollectionTestClient
//
//  Created by Fred on 05/04/15.
//  Copyright (c) 2015 wdf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDDataItem : NSObject

@property (nonatomic, strong) NSString* imagePath;
@property (nonatomic, strong) NSString* editableString;
@property (nonatomic, strong) NSString* constanteString;
@property (nonatomic, strong) NSNumber* editableBool;

@end
