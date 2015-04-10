//
//  WDTestCollectionView.m
//  WDCollectionTestClient
//
//  Created by Fred on 06/04/15.
//  Copyright (c) 2015 wdf. All rights reserved.
//

#import "WDTestCollectionView.h"
#import "WDDataset.h"
#import "WDDataItem.h"

@implementation WDTestCollectionView

- (void)awakeFromNib {

    [self addObserver:self
           forKeyPath:@"datasetContentSourceArrayController.arrangedObjects"
              options:0
              context:nil];
}

#pragma mark -
#pragma mark KVO
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{

    if([keyPath isEqualToString:@"datasetContentSourceArrayController.arrangedObjects"]){
        NSLog(@"WDTestCollectionView - datasource changed!");

        //get dataset id, if available. Can be also NIL.
        NSString *datasetId;
        if([self.datasetNameSourceArrayController.selectedObjects count]>0){
            datasetId = ((WDDataset *)self.datasetNameSourceArrayController.selectedObjects[0]).datasetKey;
        }

        [super changedDatasource:self.datasetContentSourceArrayController.arrangedObjects
                withDatasourceId:datasetId];
    }
}

+(NSURL*)getImageUrlFromRepresentedObject:(id)representedObject{
    WDDataItem * obj = representedObject;
    return [NSURL URLWithString:obj.imagePath];
}

@end
