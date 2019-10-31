//
//  XMViewController.m
//  UMRestorationTest
//
//  Created by umer on 2019/10/31.
//  Copyright © 2019 umer. All rights reserved.
//

#import "XMViewController.h"
#import "AppDelegate.h"

@interface XMViewController ()<UIObjectRestoration,UIViewControllerRestoration>

@end

@implementation XMViewController
- (instancetype)init {
    self = [super init];
    if (self) {
        self.restorationIdentifier = NSStringFromClass([self class]);
        self.restorationClass = [self class];
    }
    return self;
}
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.restorationIdentifier = NSStringFromClass([self class]);
        self.restorationClass = [self class];

    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.restorationIdentifier = NSStringFromClass([self class]);
        self.restorationClass = [self class];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (nullable UIViewController *) viewControllerWithRestorationIdentifierPath:(NSArray<NSString *> *)identifierComponents coder:(NSCoder *)coder {
    XMViewController * nav = [[XMViewController alloc]init];
    UIViewController * rootVC = ((AppDelegate *)([UIApplication sharedApplication].delegate)).windows.rootViewController;
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController * tab =  rootVC;
        [tab addChildViewController:nav];
    }
    return nav;
}
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
    
}
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
    
}
@end
