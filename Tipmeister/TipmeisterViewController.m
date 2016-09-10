//
//  ViewController.m
//  Tippr
//
//  Created by Yash Kshirsagar on 9/7/16.
//  Copyright © 2016 Yash Kshirsagar. All rights reserved.
//

#import "TipmeisterViewController.h"

@interface TipmeisterViewController ()
@property (strong, nonatomic) IBOutlet UIView *tipViewOutlet;
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property NSUserDefaults *defaults;

@end

@implementation TipmeisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tipmeister";
    self.tipLabel.text = @"$0.00";
    self.defaults = [NSUserDefaults standardUserDefaults];
    [self updateValues];
}

- (void)viewWillAppear:(BOOL)animated {
    NSInteger tipIndex = [self.defaults integerForKey:@"default_tip_index"];
    [self.tipControl setSelectedSegmentIndex:tipIndex];
    [self updateValues];

    // animations galore!
    self.tipViewOutlet.alpha = 0;

    // only animate for placeholder
    if ([self.billTextField.text integerValue] == 0) {
        self.billTextField.alpha = 0;
    }


    [UIView animateWithDuration:0.42 animations:^{
        // This causes the tip view to fade in
        self.tipViewOutlet.alpha = 1;
    } completion:^(BOOL finished) {
        // only animate for placeholder
        if ([self.billTextField.text integerValue] == 0) {
            [UIView animateWithDuration:0.3 animations:^{
                // This causes the bill text to fade in
                self.billTextField.alpha = 1;
            } completion:^(BOOL finished) {}];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}
- (IBAction)onValueChange:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.15), @(0.2), @(0.25)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;

    float totalAmount = billAmount + tipAmount;

    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
}

@end
