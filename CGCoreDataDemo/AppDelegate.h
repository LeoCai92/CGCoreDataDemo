//
//  AppDelegate.h
//  CGCoreDataDemo
//
//  Created by stu on 10/4/15.
//  Copyright (c) 2015 cgit.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

#pragma mark - 
#pragma mark - <Core Data Properties>
// 定义Core Data的三个核心API
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

#pragma mark -
#pragma mark - <Core Data Methods>
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@end

