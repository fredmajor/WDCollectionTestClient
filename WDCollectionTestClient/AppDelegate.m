//
//  AppDelegate.m
//  WDCollectionTestClient
//
//  Created by Fred on 05/04/15.
//  Copyright (c) 2015 wdf. All rights reserved.
//

#import "AppDelegate.h"
#import "WDDatasetArrayController.h"
#import "WDDataset.h"
#import "WDDataItem.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

@synthesize datasets;
@synthesize removeIndTB;
@synthesize duplicateFromTB;
@synthesize duplicateToTB;
@synthesize datasetArrayController;
@synthesize datasetsTableView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


-(void) awakeFromNib{
    NSLog(@"APP delegate is up from NIB.");
    self.datasets = [NSMutableArray array];
    self.datasetArrayController.window = self.window;
}

- (IBAction)removeDataItemAtIndex:(id)sender{
    if([self.datasetArrayController.selectionIndexes count] != 0){
        NSLog(@"Some dataset selected");
        NSInteger remInd =  [[removeIndTB stringValue] integerValue];
        NSLog(@"Index to be removed from the dataset is: %ld", (long)remInd);
        
        
        //simulate "external" way of changing
        NSUInteger datasetIndex = [self.datasetArrayController.selectionIndexes firstIndex];
        WDDataset *currentDataset = self.datasets[datasetIndex];
        if([currentDataset.dataItems count] >remInd){
            NSLog(@"dataset items length is ok, can remove");
            [currentDataset.dataItems removeObjectAtIndex:remInd];
            currentDataset.itemsReported--;
            [datasetsTableView reloadData];
        }else{
            NSLog(@"given index out of range!!");
        }
    }else{
        NSLog(@"No dataset selected!");
    }

}

- (IBAction)duplicateCurrentAndInsertAtIndex:(id)sender{
    
    if([self.datasetArrayController.selectionIndexes count] != 0){
        
        NSUInteger datasetIndex = [self.datasetArrayController.selectionIndexes firstIndex];
        WDDataset *currentDataset = self.datasets[datasetIndex];
        
        
        NSLog(@"Dataset with id=%@ selected.", currentDataset.datasetKey);
        NSInteger fromInd =  [[duplicateFromTB stringValue] integerValue];
        NSInteger toInd =  [[duplicateToTB stringValue] integerValue];
        NSLog(@"Will duplicate item from index %ld to index %ld", (long)fromInd, (long) toInd);
        
        if([currentDataset.dataItems count] > fromInd && [currentDataset.dataItems count]>= toInd){
            WDDataItem *itemToDup = [currentDataset.dataItems objectAtIndex:fromInd];
            [currentDataset.dataItems insertObject:itemToDup atIndex:toInd];
            currentDataset.itemsReported++;
            [datasetsTableView reloadData];
            
        }else{
            NSLog(@"Wrong indices given!!");
        }
    }else{
        NSLog(@"No dataset selected!");
    }
}

- (IBAction)printItems:(id)sender{
    if([self.datasetArrayController.selectionIndexes count] != 0){
        
        NSUInteger datasetIndex = [self.datasetArrayController.selectionIndexes firstIndex];
        WDDataset *currentDataset = self.datasets[datasetIndex];
        
        
        NSLog(@"Dataset with id=%@ selected. Printing items.", currentDataset.datasetKey);
        [currentDataset.dataItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"%lu: %@",idx, obj);
        }];

    }else{
        NSLog(@"No dataset selected!");
    }
}

@end
