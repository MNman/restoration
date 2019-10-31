//
//  TBViewController.m
//  UMRestorationTest
//
//  Created by umer on 2019/10/31.
//  Copyright © 2019 umer. All rights reserved.
//

#import "TBViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"
@interface TBViewController () <UIViewControllerRestoration>

@end

@implementation TBViewController
- (instancetype)init {
    self = [super init];
    if (self) {
        self.restorationClass = [self class];
        self.restorationIdentifier = NSStringFromClass([self class]);
    }
    return self;
}
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.restorationClass = [self class];
        self.restorationIdentifier = NSStringFromClass([self class]);
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (nullable UIViewController *) viewControllerWithRestorationIdentifierPath:(NSArray<NSString *> *)identifierComponents coder:(NSCoder *)coder {
    TBViewController * tab = [[TBViewController alloc]init];
    ((AppDelegate *)([UIApplication sharedApplication].delegate)).windows.rootViewController = tab;
    return tab;
}
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
    
}
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
    
}
@end
