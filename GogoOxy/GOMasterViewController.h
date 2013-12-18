//
//  GOMasterViewController.h
//  GogoOxy
//
//  Created by oxy.hsing on 2013/12/18.
//  Copyright (c) 2013年 oxyDevGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface GOMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
