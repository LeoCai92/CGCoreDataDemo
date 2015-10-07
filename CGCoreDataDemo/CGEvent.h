//
//  CGEvent.h
//  CGCoreDataDemo
//
//  Created by stu on 10/4/15.
//  Copyright (c) 2015 cgit.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CGEvent : NSManagedObject

@property (nonatomic, retain) NSDate * happenDate;
@property (nonatomic, retain) NSString * name;

@end
