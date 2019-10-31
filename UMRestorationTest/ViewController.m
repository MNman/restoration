//
//  ViewController.m
//  UMRestorationTest
//
//  Created by umer on 2019/10/30.
//  Copyright © 2019 umer. All rights reserved.
//

#import "ViewController.h"
#import "XMViewController.h"
#import "MMMViewController.h"
#import "AppDelegate.h"
@interface ViewController ()<UIObjectRestoration,UIViewControllerRestoration>
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *nextButton;
@end

@implementation ViewController
- (instancetype)init{
    self = [super init];
    if (self) {
        self.restorationIdentifier = NSStringFromClass([ViewController class]);
        self.restorationClass = [ViewController class];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.textField];
    self.textField.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:self.nextButton];
    self.nextButton.frame = CGRectMake(100, 300, 100, 100);
}


- (UITextField *)textField {
    if (_textField) return _textField;
    _textField = [[UITextField alloc]init];
    _textField.textColor = [UIColor redColor];
    _textField.backgroundColor = [UIColor blackColor];
    return _textField;
}

+ (nullable UIViewController *) viewControllerWithRestorationIdentifierPath:(NSArray<NSString *> *)identifierComponents coder:(NSCoder *)coder {
    ViewController * vc = [[ViewController alloc]init];
    UIViewController * rootVC = ((AppDelegate *)([UIApplication sharedApplication].delegate)).windows.rootViewController;
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController * tab =  rootVC;
        [tab addChildViewController:vc];
    }
    return vc;
}
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
    self.textField.text = [coder decodeObjectForKey:@"text123"];
}
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
    [coder encodeObject:self.textField.text forKey:@"text123"];
}
- (UIButton *)nextButton{
    if(_nextButton) return _nextButton;
    _nextButton = [[UIButton alloc]init];
    [_nextButton addTarget:self action:@selector(nextButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [_nextButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    return _nextButton;
}
- (void)nextButtonEvent:(UIButton *)button {
    MMMViewController * vc = [[MMMViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
//    [self.navigationController pushViewController:vc animated:YES];
}
@end
