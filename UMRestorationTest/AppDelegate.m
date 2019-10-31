//
//  AppDelegate.m
//  UMRestorationTest
//
//  Created by umer on 2019/10/30.
//  Copyright © 2019 umer. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "XMViewController.h"
#import "TBViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
    self.windows = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    return YES;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    XMViewController * tabbar;
    if (!self.windows.rootViewController) {
        ViewController * vc = [[ViewController alloc]init];
        tabbar = [[XMViewController alloc]initWithRootViewController:vc];
        self.windows.rootViewController = tabbar;
    }
    [self.windows makeKeyAndVisible];
    
    return YES;
}
- (UIViewController *)application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray<NSString *> *)identifierComponents coder:(NSCoder *)coder {
    return nil;
}
- (BOOL) application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder {
    return YES;
}
- (BOOL) application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder {
    return YES;
}
#pragma mark - UISceneSession lifecycle



@end
