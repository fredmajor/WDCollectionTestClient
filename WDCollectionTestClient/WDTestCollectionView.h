//
//  WDTestCollectionView.h
//  WDCollectionTestClient
//
//  Created by Fred on 06/04/15.
//  Copyright (c) 2015 wdf. All rights reserved.
//

#import "WDCollectionView.h"

@interface WDTestCollectionView : WDCollectionView

@property (weak, nonatomic) IBOutlet NSArrayController* datasetNameSourceArrayController;
@property (weak, nonatomic) IBOutlet NSArrayController* datasetContentSourceArrayController;

@end
