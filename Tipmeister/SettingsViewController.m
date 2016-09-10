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
@property (weak, nonatomic) IBOutlet UILabel *defaultTipLabel;
@property NSUserDefaults *defaults;
@property (strong, nonatomic) IBOutlet UIView *viewOutlet;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.defaults = [NSUserDefaults standardUserDefaults];
    NSInteger tipIndex = [self.defaults integerForKey:@"default_tip_index"];
    [self.defaultTipControl setSelectedSegmentIndex:tipIndex];
}

- (void)viewWillAppear:(BOOL)animated {
    // animations galore
    self.viewOutlet.alpha = 0;
    self.defaultTipControl.alpha = 0;
    self.defaultTipLabel.alpha = 0;


    [UIView animateWithDuration:0.42 animations:^{
        // This causes the settings view to fade in
        self.viewOutlet.alpha = 1;
        self.defaultTipControl.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
        self.defaultTipLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
    } completion:^(BOOL finished) {
        // fade the controls in.
        [UIView animateWithDuration:0.3 animations:^{
            self.defaultTipControl.alpha = 1;
            self.defaultTipLabel.alpha = 1;
            self.defaultTipControl.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
            self.defaultTipLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
        } completion:^(BOOL finished) {
            self.defaultTipControl.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
            self.defaultTipLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
        }];
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    // Optionally initialize the property to a desired starting value
    self.viewOutlet.alpha = 1;
    self.defaultTipControl.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
    self.defaultTipLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);

    [UIView animateWithDuration:0.42 animations:^{
        // This causes the settings view to fade in
        self.viewOutlet.alpha = 0;
        self.defaultTipControl.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
        self.defaultTipLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
    } completion:^(BOOL finished) {
        // Do something here when the animation finishes.
    }];
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
