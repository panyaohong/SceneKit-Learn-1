//
//  AppDelegate.h
//  SceneKit Learn 1
//
//  Created by 潘耀洪 on 2017/5/3.
//  Copyright © 2017年 潘耀洪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

