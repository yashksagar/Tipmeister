//
//  ViewController.m
//  Tippr
//
//  Created by Yash Kshirsagar on 9/7/16.
//  Copyright © 2016 Yash Kshirsagar. All rights reserved.
//

#import "TipmeisterViewController.h"

@interface TipmeisterViewController ()
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
    NSLog(@"tipview did load");
    
    [self updateValues];

}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSInteger tipIndex = [self.defaults integerForKey:@"default_tip_index"];
    NSLog(@"default tip: %ld", tipIndex);

    [self.tipControl setSelectedSegmentIndex:tipIndex];
    [self updateValues];
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
