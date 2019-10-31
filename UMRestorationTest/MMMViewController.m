//
//  MMMViewController.m
//  UMRestorationTest
//
//  Created by umer on 2019/10/31.
//  Copyright © 2019 umer. All rights reserved.
//

#import "MMMViewController.h"

@interface MMMViewController () <UIViewControllerRestoration>

@end

@implementation MMMViewController
- (instancetype)init {
    self = [super init];
    if (self) {
        self.restorationIdentifier = NSStringFromClass([self class]);
        self.restorationClass = [self class];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
+ (nullable UIViewController *) viewControllerWithRestorationIdentifierPath:(NSArray<NSString *> *)identifierComponents coder:(NSCoder *)coder {
    MMMViewController * vc = [[MMMViewController alloc]init];
    return vc;
}
- (void) encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
}
- (void) decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
}
@end
