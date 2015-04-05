//
//  WDDatasetArrayController.m
//  WDCollectionTestClient
//
//  Created by Fred on 05/04/15.
//  Copyright (c) 2015 wdf. All rights reserved.
//

#import "WDDatasetArrayController.h"
#import "WDDataset.h"
#import "WDDataItem.h"

@implementation WDDatasetArrayController
@synthesize window;

-(id) newObject{
    
    WDDataset* newDataset =  [super newObject];
    
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    //set the title of the dialogue window
    openDlg.title = NSLocalizedString(@"Choose a directory to upload", @"");
    
    //shoud the user be able to resize the window?
    openDlg.showsResizeIndicator = YES;
    
    //should the user see hidden files (for user apps - usually no)
    openDlg.showsHiddenFiles = NO;
    
    //can the user select a directory?
    openDlg.canChooseDirectories = YES;
    openDlg.canChooseFiles = NO;
    
    //can the user create directories while using the dialogue?
    openDlg.canCreateDirectories = NO;
    
    //should the user be able to select multiple files?
    openDlg.allowsMultipleSelection = NO;
    
    // [openDlg setAccessoryView:openDirCustomView];
    
    [openDlg beginSheetModalForWindow:self.window completionHandler:^(NSInteger result) {
        if (result == NSFileHandlingPanelOKButton) {
            NSLog(@"OK");
            NSURL*  dirUrl = [[openDlg URLs] objectAtIndex:0];
            
            newDataset.datasetKey = [[dirUrl absoluteString] lastPathComponent];
            
            NSArray *keys = [NSArray arrayWithObjects:
                             NSURLIsDirectoryKey,
                             NSURLTotalFileAllocatedSizeKey, nil];
            
            NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtURL:dirUrl
                                                                     includingPropertiesForKeys:keys
                                                                                        options:(NSDirectoryEnumerationSkipsPackageDescendants |
                                                                                                 NSDirectoryEnumerationSkipsHiddenFiles)
                                                                                   errorHandler:^(NSURL *url, NSError *error) {
                                                                                       NSLog(@"Error while enumerating the added dir");
                                                                                       return YES;
                                                                                   }];
            
            NSMutableArray* array = [NSMutableArray array];
            for (NSURL *fileURL in enumerator) {
                
                NSString *filename;
                [fileURL getResourceValue:&filename forKey:NSURLNameKey error:nil];
                
                NSNumber *isDirectory;
                [fileURL getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:nil];
                
                if(![isDirectory boolValue]){
                    WDDataItem *dItem = [[WDDataItem alloc]init];
                    dItem.imagePath = [fileURL absoluteString];
                    [array addObject:dItem];
                }
            }
            
            newDataset.dataItems = array;
            newDataset.itemsReported = [array count];
        }
    }];
    
    return newDataset;
}

@end
