//
//  AppDelegate.h
//  WDCollectionTestClient
//
//  Created by Fred on 05/04/15.
//  Copyright (c) 2015 wdf. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class WDDatasetArrayController;

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak, nonatomic) IBOutlet WDDatasetArrayController* datasetArrayController;
@property (weak, nonatomic) IBOutlet NSTextField* removeIndTB;

@property (weak, nonatomic) IBOutlet NSTextField* duplicateFromTB;
@property (weak, nonatomic) IBOutlet NSTextField* duplicateToTB;

@property (strong, nonatomic) NSMutableArray* datasets;
@property (weak, nonatomic) IBOutlet NSTableView *datasetsTableView;
@property (weak, nonatomic) IBOutlet NSTableView *dataItemTableView;

- (IBAction)removeDataItemAtIndex:(id)sender;
- (IBAction)duplicateCurrentAndInsertAtIndex:(id)sender;
- (IBAction)printItems:(id)sender;
@end

