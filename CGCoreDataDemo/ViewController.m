//
//  ViewController.m
//  CGCoreDataDemo
//
//  Created by stu on 10/4/15.
//  Copyright (c) 2015 cgit.org. All rights reserved.
//

#import "ViewController.h"
#import "CGEvent.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (nonatomic, strong) AppDelegate *appDelegate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _appDelegate = [UIApplication sharedApplication].delegate;
    NSLog(@"%@ %p",_appDelegate,_appDelegate);
    
    // 使用Core Data
    [self useCoreData];
    
}

#pragma mark -
#pragma mark - Using Core Data
- (void) useCoreData{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"王五",@"name", [NSDate date],@"happenDate",nil];
    [self addEntity:dict];
    
    NSArray *result = [self queryEntity:nil];
    for (CGEvent *event  in result) {
        NSLog(@"name:%@ happenDate:%@",event.name,event.happenDate);
        
    }
}

// 增加
- (void)addEntity:(NSDictionary *)dict{
    CGEvent *event = [NSEntityDescription insertNewObjectForEntityForName:@"CGEvent" inManagedObjectContext:_appDelegate.managedObjectContext];
    [event setName:[dict objectForKey:@"name"]];
    [event setHappenDate:[dict objectForKey:@"happenDate"]];
    
     // 保存
     NSError *error = nil;
     BOOL isSave = [_appDelegate.managedObjectContext save:&error];
     if (!isSave) {
         NSLog(@"保存error:%@,%@",error,[error userInfo]);
     }
     else{
         NSLog(@"保存成功！");
     }
}

// 删除
- (void)deleteEntity:(CGEvent *)event{
    // 删除
    NSError *error = nil;
    [_appDelegate.managedObjectContext deleteObject:event];
    BOOL isDelete = [_appDelegate.managedObjectContext save:&error];
    if (!isDelete) {
        NSLog(@"删除error:%@,%@",error,[error userInfo]);
    }
    else{
        NSLog(@"删除成功！");
    }
}

// 查询
- (NSArray *)queryEntity:(NSDictionary *)dict{
    // 查询
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CGEvent" inManagedObjectContext:_appDelegate.managedObjectContext];
    [request setEntity:entity];
    NSArray *result = [_appDelegate.managedObjectContext executeFetchRequest:request error:&error];
    return result;
}

// 修改
- (void)modifyEntity:(CGEvent *)event withDict:(NSDictionary *)dict{
    // 修改实体
    NSError *error = nil;
    [event setName:[dict objectForKey:@"name"]];
    [event setHappenDate:[dict objectForKey:@"happenDate"]];
    BOOL isModify = [_appDelegate.managedObjectContext save:&error];
    if (!isModify) {
        NSLog(@"修改error:%@,%@",error,[error userInfo]);
    }
    else{
        NSLog(@"修改成功！");
    }
}

#pragma mark -
#pragma mark - others
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
