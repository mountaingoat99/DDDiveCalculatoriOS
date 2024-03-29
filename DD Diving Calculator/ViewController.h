//
//  ViewController.h
//  DD Diving Calculator
//
//  Created by Jeremey Rodriguez on 1/27/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *viewTop;
@property (weak, nonatomic) IBOutlet UIView *viewBottom;
@property (weak, nonatomic) IBOutlet UITextField *txtdd;
@property (weak, nonatomic) IBOutlet UITextField *txtScore1;
@property (weak, nonatomic) IBOutlet UITextField *txtScore2;
@property (weak, nonatomic) IBOutlet UITextField *txtScore3;
@property (weak, nonatomic) IBOutlet UITextField *txtScore4;
@property (weak, nonatomic) IBOutlet UITextField *txtScore5;
@property (weak, nonatomic) IBOutlet UITextField *txtScore6;
@property (weak, nonatomic) IBOutlet UITextField *txtScore7;
@property (weak, nonatomic) IBOutlet UILabel *lblTotal;

- (IBAction)btnClear:(id)sender;
- (IBAction)btnTotal:(id)sender;
- (IBAction)btnOne:(id)sender;
- (IBAction)btnTwo:(id)sender;
- (IBAction)btnThree:(id)sender;
- (IBAction)btnFour:(id)sender;
- (IBAction)btnFive:(id)sender;
- (IBAction)btnSix:(id)sender;
- (IBAction)btnSeven:(id)sender;
- (IBAction)btnEight:(id)sender;
- (IBAction)btnNine:(id)sender;
- (IBAction)btnZero:(id)sender;
- (IBAction)btnPeriod:(id)sender;
- (IBAction)btnNext:(id)sender;
- (IBAction)btnBack:(id)sender;

@end

