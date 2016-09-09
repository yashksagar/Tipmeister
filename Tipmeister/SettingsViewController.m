//
//  SettingsViewController.m
//  Tipmeister
//
//  Created by Yash Kshirsagar on 9/8/16.
//  Copyright © 2016 Yash Kshirsagar. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;
@property NSUserDefaults *defaults;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.defaults = [NSUserDefaults standardUserDefaults];
    NSInteger tipIndex = [self.defaults integerForKey:@"default_tip_index"];
    [self.defaultTipControl setSelectedSegmentIndex:tipIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onValueChange:(UISegmentedControl *)sender {
    [self updateDefault:@"default_tip_index" :self.defaultTipControl.selectedSegmentIndex];
}

- (void)updateDefault:(NSString *)key :(float)val {
    [self.defaults setInteger:val forKey:key];
    [self.defaults synchronize];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
