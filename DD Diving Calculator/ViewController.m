//
//  ViewController.m
//  DD Diving Calculator
//
//  Created by Jeremey Rodriguez on 1/27/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSNumber *sc1;
@property (nonatomic, strong) NSNumber *sc2;
@property (nonatomic, strong) NSNumber *sc3;
@property (nonatomic, strong) NSNumber *sc4;
@property (nonatomic, strong) NSNumber *sc5;
@property (nonatomic, strong) NSNumber *sc6;
@property (nonatomic, strong) NSNumber *sc7;
@property (nonatomic, strong) NSNumber *total;

@property (nonatomic) double dd;
@property (nonatomic) double score1;
@property (nonatomic) double score2;
@property (nonatomic) double score3;
@property (nonatomic) double score4;
@property (nonatomic) double score5;
@property (nonatomic) double score6;
@property (nonatomic) double score7;

-(NSString*)CalcScores;
-(void)UpdateTxtField:(NSString*)digit;
-(NSString*)CheckRegEx:(NSString*)enteredNumber textNumber:(NSString*)textNumber;
-(NSString*)DeleteText:(NSString*)textfield;
-(void)removeTextToolbar:(UITextInputAssistantItem*)textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewTop.layer.shadowColor = [UIColor blackColor].CGColor;
    self.viewTop.layer.shadowOffset = CGSizeMake(.1f, .1f);
    self.viewTop.layer.masksToBounds = NO;
    self.viewTop.layer.shadowOpacity = .5;
    
    self.viewBottom.layer.shadowColor = [UIColor blackColor].CGColor;
    self.viewBottom.layer.shadowOffset = CGSizeMake(.1f, .1f);
    self.viewBottom.layer.masksToBounds = NO;
    self.viewBottom.layer.shadowOpacity = .5;
    
    self.txtdd.delegate = self;
    self.txtScore1.delegate = self;
    self.txtScore2.delegate = self;
    self.txtScore3.delegate = self;
    self.txtScore4.delegate = self;
    self.txtScore5.delegate = self;
    self.txtScore6.delegate = self;
    self.txtScore7.delegate = self;
    
    // disable the keyboard on the UITextFields
    UIView *dummyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    self.txtdd.inputView = dummyView;
    self.txtScore1.inputView = dummyView;
    self.txtScore2.inputView = dummyView;
    self.txtScore3.inputView = dummyView;
    self.txtScore4.inputView = dummyView;
    self.txtScore5.inputView = dummyView;
    self.txtScore6.inputView = dummyView;
    self.txtScore7.inputView = dummyView;
    
    [self removeTextToolbar:[self.txtdd inputAssistantItem]];
    [self removeTextToolbar:[self.txtScore1 inputAssistantItem]];
    [self removeTextToolbar:[self.txtScore2 inputAssistantItem]];
    [self removeTextToolbar:[self.txtScore3 inputAssistantItem]];
    [self removeTextToolbar:[self.txtScore4 inputAssistantItem]];
    [self removeTextToolbar:[self.txtScore5 inputAssistantItem]];
    [self removeTextToolbar:[self.txtScore6 inputAssistantItem]];
    [self removeTextToolbar:[self.txtScore7 inputAssistantItem]];
    
    [self.txtdd becomeFirstResponder];
    [self.txtdd setHighlighted:YES];
}

// only allow portrait in iphone
-(BOOL)shouldAutorotate {
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        return NO;
        
    } else {
        
        return YES;
    }
}

// state restoration
-(void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder];
    
    [coder encodeObject:self.txtdd.text forKey:@"ddText"];
    [coder encodeObject:self.txtScore1.text forKey:@"score1"];
    [coder encodeObject:self.txtScore2.text forKey:@"score2"];
    [coder encodeObject:self.txtScore3.text forKey:@"score3"];
    [coder encodeObject:self.txtScore4.text forKey:@"score4"];
    [coder encodeObject:self.txtScore5.text forKey:@"score5"];
    [coder encodeObject:self.txtScore6.text forKey:@"score6"];
    [coder encodeObject:self.txtScore7.text forKey:@"score7"];
    [coder encodeObject:self.lblTotal.text forKey:@"total"];
    
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder  {
    [super decodeRestorableStateWithCoder:coder];
    
    self.txtdd.text = [coder decodeObjectForKey:@"ddText"];
    self.txtScore1.text = [coder decodeObjectForKey:@"score1"];
    self.txtScore2.text = [coder decodeObjectForKey:@"score2"];
    self.txtScore3.text = [coder decodeObjectForKey:@"score3"];
    self.txtScore4.text = [coder decodeObjectForKey:@"score4"];
    self.txtScore5.text = [coder decodeObjectForKey:@"score5"];
    self.txtScore6.text = [coder decodeObjectForKey:@"score6"];
    self.txtScore7.text = [coder decodeObjectForKey:@"score7"];
    self.lblTotal.text = [coder decodeObjectForKey:@"total"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) textFieldDidBeginEditing:(UITextField *)textField {
    
    if (textField == self.txtdd) {
        [self.txtScore1 setHighlighted:NO];
        [self.txtScore2 setHighlighted:NO];
        [self.txtScore3 setHighlighted:NO];
        [self.txtScore4 setHighlighted:NO];
        [self.txtScore5 setHighlighted:NO];
        [self.txtScore6 setHighlighted:NO];
        [self.txtScore7 setHighlighted:NO];
    }
    
    if (textField == self.txtScore1) {
        [self.txtdd setHighlighted:NO];
        [self.txtScore2 setHighlighted:NO];
        [self.txtScore3 setHighlighted:NO];
        [self.txtScore4 setHighlighted:NO];
        [self.txtScore5 setHighlighted:NO];
        [self.txtScore6 setHighlighted:NO];
        [self.txtScore7 setHighlighted:NO];
    }
    
    if (textField == self.txtScore2) {
        [self.txtdd setHighlighted:NO];
        [self.txtScore1 setHighlighted:NO];
        [self.txtScore3 setHighlighted:NO];
        [self.txtScore4 setHighlighted:NO];
        [self.txtScore5 setHighlighted:NO];
        [self.txtScore6 setHighlighted:NO];
        [self.txtScore7 setHighlighted:NO];
    }
    
    if (textField == self.txtScore3) {
        [self.txtdd setHighlighted:NO];
        [self.txtScore2 setHighlighted:NO];
        [self.txtScore1 setHighlighted:NO];
        [self.txtScore4 setHighlighted:NO];
        [self.txtScore5 setHighlighted:NO];
        [self.txtScore6 setHighlighted:NO];
        [self.txtScore7 setHighlighted:NO];
    }
    
    if (textField == self.txtScore4) {
        [self.txtdd setHighlighted:NO];
        [self.txtScore2 setHighlighted:NO];
        [self.txtScore3 setHighlighted:NO];
        [self.txtScore1 setHighlighted:NO];
        [self.txtScore5 setHighlighted:NO];
        [self.txtScore6 setHighlighted:NO];
        [self.txtScore7 setHighlighted:NO];
    }
    
    if (textField == self.txtScore5) {
        [self.txtdd setHighlighted:NO];
        [self.txtScore2 setHighlighted:NO];
        [self.txtScore3 setHighlighted:NO];
        [self.txtScore4 setHighlighted:NO];
        [self.txtScore1 setHighlighted:NO];
        [self.txtScore6 setHighlighted:NO];
        [self.txtScore7 setHighlighted:NO];
    }
    
    if (textField == self.txtScore6) {
        [self.txtdd setHighlighted:NO];
        [self.txtScore2 setHighlighted:NO];
        [self.txtScore3 setHighlighted:NO];
        [self.txtScore4 setHighlighted:NO];
        [self.txtScore5 setHighlighted:NO];
        [self.txtScore1 setHighlighted:NO];
        [self.txtScore7 setHighlighted:NO];
    }
    
    if (textField == self.txtScore7) {
        [self.txtdd setHighlighted:NO];
        [self.txtScore2 setHighlighted:NO];
        [self.txtScore3 setHighlighted:NO];
        [self.txtScore4 setHighlighted:NO];
        [self.txtScore5 setHighlighted:NO];
        [self.txtScore6 setHighlighted:NO];
        [self.txtScore1 setHighlighted:NO];
    }
}

- (IBAction)btnClear:(id)sender {
    
    self.txtdd.text = @"";
    self.txtScore1.text = @"";
    self.txtScore2.text = @"";
    self.txtScore3.text = @"";
    self.txtScore4.text = @"";
    self.txtScore5.text = @"";
    self.txtScore6.text = @"";
    self.txtScore7.text = @"";
    self.lblTotal.text = @"";
    self.dd = 0;
    self.total = nil;
    self.sc1 = nil;
    self.sc2 = nil;
    self.sc3 = nil;
    self.sc4 = nil;
    self.sc5 = nil;
    self.sc6 = nil;
    self.sc7 = nil;
    [self.txtdd becomeFirstResponder];
    [self.txtdd setHighlighted:YES];
    [self.txtScore1 setHighlighted:NO];
    [self.txtScore2 setHighlighted:NO];
    [self.txtScore3 setHighlighted:NO];
    [self.txtScore4 setHighlighted:NO];
    [self.txtScore5 setHighlighted:NO];
    [self.txtScore6 setHighlighted:NO];
    [self.txtScore7 setHighlighted:NO];
}

- (IBAction)btnTotal:(id)sender {
    
    if (self.txtdd.text.length > 0) {
        
        self.lblTotal.text = [self CalcScores];
        
    } else {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Hold On!"
                                                        message:@"Please enter a Dive DD"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [error show];
        [error reloadInputViews];
    }
}

- (IBAction)btnOne:(id)sender {
    
    [self UpdateTxtField:@"1"];
}

- (IBAction)btnTwo:(id)sender {
    
    [self UpdateTxtField:@"2"];
}

- (IBAction)btnThree:(id)sender {
    
    [self UpdateTxtField:@"3"];
}

- (IBAction)btnFour:(id)sender {
    
    [self UpdateTxtField:@"4"];
}

- (IBAction)btnFive:(id)sender {
    
    [self UpdateTxtField:@"5"];
}

- (IBAction)btnSix:(id)sender {
    
    [self UpdateTxtField:@"6"];
}

- (IBAction)btnSeven:(id)sender {
    
    [self UpdateTxtField:@"7"];
}

- (IBAction)btnEight:(id)sender {
    
    [self UpdateTxtField:@"8"];
}

- (IBAction)btnNine:(id)sender {
    
    [self UpdateTxtField:@"9"];
}

- (IBAction)btnZero:(id)sender {
    
    [self UpdateTxtField:@"0"];
}

- (IBAction)btnPeriod:(id)sender {
    
    [self UpdateTxtField:@"."];
}

- (IBAction)btnNext:(id)sender {
    
    if (self.txtdd.highlighted) {
        [self.txtScore1 becomeFirstResponder];
        [self.txtScore1 setHighlighted:YES];
        [self.txtdd setHighlighted:NO];
        return;
    }
    if (self.txtScore1.highlighted) {
        [self.txtScore2 becomeFirstResponder];
        [self.txtScore2 setHighlighted:YES];
        [self.txtScore1 setHighlighted:NO];
        return;
    }
    if (self.txtScore2.highlighted) {
        [self.txtScore3 becomeFirstResponder];
        [self.txtScore3 setHighlighted:YES];
        [self.txtScore2 setHighlighted:NO];
        return;
    }
    if (self.txtScore3.highlighted) {
        [self.txtScore4 becomeFirstResponder];
        [self.txtScore4 setHighlighted:YES];
        [self.txtScore3 setHighlighted:NO];
        return;
    }
    if (self.txtScore4.highlighted) {
        [self.txtScore5 becomeFirstResponder];
        [self.txtScore5 setHighlighted:YES];
        [self.txtScore4 setHighlighted:NO];
        return;
    }
    if (self.txtScore5.highlighted) {
        [self.txtScore6 becomeFirstResponder];
        [self.txtScore6 setHighlighted:YES];
        [self.txtScore5 setHighlighted:NO];
        return;
    }
    if (self.txtScore6.highlighted) {
        [self.txtScore7 becomeFirstResponder];
        [self.txtScore7 setHighlighted:YES];
        [self.txtScore6 setHighlighted:NO];
        return;
    }
    if (self.txtScore7.highlighted) {
        [self.txtdd becomeFirstResponder];
        [self.txtdd setHighlighted:YES];
        [self.txtScore7 setHighlighted:NO];
    }
}

- (IBAction)btnBack:(id)sender {
    
    if (self.txtdd.highlighted) {
        
        // we only want to erase if there is text, error otherwise
        if (self.txtdd.text.length > 0) {
            
            self.txtdd.text = [self DeleteText:self.txtdd.text];
        }
    }
    
    if (self.txtScore1.highlighted) {
        
        if (self.txtScore1.text.length > 0) {
            
            self.txtScore1.text = [self DeleteText:self.txtScore1.text];
        }
    }
    
    if (self.txtScore2.highlighted) {
        
        if (self.txtScore2.text.length > 0) {
            
            self.txtScore2.text = [self DeleteText:self.txtScore2.text];
        }
    }
    
    if (self.txtScore3.highlighted) {
        
        if (self.txtScore3.text.length > 0) {
            
            self.txtScore3.text = [self DeleteText:self.txtScore3.text];
        }
    }
    
    if (self.txtScore4.highlighted) {
        
        if (self.txtScore4.text.length > 0) {
            
            self.txtScore4.text = [self DeleteText:self.txtScore4.text];
        }
    }
    
    if (self.txtScore5.highlighted) {
        
        if (self.txtScore5.text.length > 0) {
            
            self.txtScore5.text = [self DeleteText:self.txtScore5.text];
        }
    }
    
    if (self.txtScore6.highlighted) {
        
        if (self.txtScore6.text.length > 0) {
            
            self.txtScore6.text = [self DeleteText:self.txtScore6.text];
        }
    }
    
    if (self.txtScore7.highlighted) {
        
        if (self.txtScore7.text.length > 0) {
            
            self.txtScore7.text = [self DeleteText:self.txtScore7.text];
        }
    }
}

#pragma private methods

-(NSString*)CalcScores {
    
    // create a mutable array
    NSMutableArray *scores = [[NSMutableArray alloc] init];
    double finalScore = 0;
    
    // get the double from the dd box
    self.dd = [self.txtdd.text doubleValue];
    
    // convert the other score boxes to NSNumber to out them in a mutable array
    if (self.txtScore1.text.length > 0) {
        self.sc1 = @([self.txtScore1.text doubleValue]);
        [scores addObject: self.sc1];
    }
    if (self.txtScore2.text.length > 0) {
        self.sc2 = @([self.txtScore2.text doubleValue]);
        [scores addObject: self.sc2];
    }
    if (self.txtScore3.text.length > 0) {
        self.sc3 = @([self.txtScore3.text doubleValue]);
        [scores addObject: self.sc3];
    }
    if (self.txtScore4.text.length > 0) {
        self.sc4 = @([self.txtScore4.text doubleValue]);
        [scores addObject: self.sc4];
    }
    if (self.txtScore5.text.length > 0) {
        self.sc5 = @([self.txtScore5.text doubleValue]);
        [scores addObject: self.sc5];
    }
    if (self.txtScore6.text.length > 0) {
        self.sc6 = @([self.txtScore6.text doubleValue]);
        [scores addObject: self.sc6];
    }
    if (self.txtScore7.text.length > 0) {
        self.sc7 = @([self.txtScore7.text doubleValue]);
        [scores addObject: self.sc7];
    }
    
    // sort the array
    NSArray *sortedScores = [scores sortedArrayUsingSelector:@selector(compare:)];
    
    if (sortedScores.count > 1) {
        if (sortedScores.count == 2) {
            //score 2 judge meet
            
            self.score1 = [[sortedScores objectAtIndex:0] doubleValue];
            self.score2 = [[sortedScores objectAtIndex:1] doubleValue];
            
            finalScore = ((self.score1 + self.score2) * 1.5) * self.dd;
            
        } else if (sortedScores.count == 3) {
            
            self.score1 = [[sortedScores objectAtIndex:0] doubleValue];
            self.score2 = [[sortedScores objectAtIndex:1] doubleValue];
            self.score3 = [[sortedScores objectAtIndex:2] doubleValue];
            
            finalScore = (self.score1 + self.score2 + self.score3) * self.dd;
            
        } else if (sortedScores.count == 5) {
            
            self.score1 = [[sortedScores objectAtIndex:1] doubleValue];
            self.score2 = [[sortedScores objectAtIndex:2] doubleValue];
            self.score3 = [[sortedScores objectAtIndex:3] doubleValue];
            
            finalScore = (self.score1 + self.score2 + self.score3) * self.dd;
            
        } else if (sortedScores.count == 7) {
            
            self.score1 = [[sortedScores objectAtIndex:2] doubleValue];
            self.score2 = [[sortedScores objectAtIndex:3] doubleValue];
            self.score3 = [[sortedScores objectAtIndex:4] doubleValue];
            
            finalScore = (self.score1 + self.score2 + self.score3) * self.dd;
            
        } else {
            UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Hold On!"
                                                            message:@"You have to enter either 2, 3, 5, or 7 scores"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [error show];
            [error reloadInputViews];
        }
    
        
    } else {
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Hold On!"
                                                        message:@"You didn't enter enough scores"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [error show];
        [error reloadInputViews];

    }
    
    NSNumber *theNumber = [NSNumber numberWithDouble:finalScore];
    
    NSNumberFormatter *fm = [[NSNumberFormatter alloc] init];
    [fm setNumberStyle:NSNumberFormatterDecimalStyle];
    [fm setMaximumFractionDigits:2];
    //[fm setRoundingMode:NSNumberFormatterRoundUp];
    
    NSString *numberString = [fm stringFromNumber:theNumber];
    
    return numberString;
}

-(NSString*)DeleteText:(NSString*)textfield {
    
    NSString *newString = [textfield substringToIndex:[textfield length] -1];
    
    return newString;
}

-(void)UpdateTxtField:(NSString*)digit {
    
    if (self.txtdd.highlighted) {
        
        // we'll just use this one since the dd uses different digits than the scores
        NSString *tempString = self.txtdd.text;
        NSRange range = NSRangeFromString([NSString stringWithFormat:@"{0:%lu}", (unsigned long)self.txtdd.text.length]);
        NSString *newString = [self.txtdd.text stringByReplacingCharactersInRange:range withString:digit];
        tempString = [tempString stringByAppendingString:newString];
        //NSString *expression = @"^([0-9]|10{1}+)?(\\.([0|5]{1})?)?$";
        NSString *expression = @"^([1-4]{1}+)?(\\.([0-9]{1})?)?$";
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:&error];
        NSUInteger numberOfMatches = [regex numberOfMatchesInString:tempString options:0 range:NSMakeRange(0, [tempString length])];
        if (numberOfMatches > 0) {
        
            self.txtdd.text = tempString;
        }
        
        if (self.txtdd.text.length == 3) {
            [self.txtScore1 becomeFirstResponder];
            [self.txtScore1 setHighlighted:YES];
            [self.txtdd setHighlighted:NO];
            return;
        }
    }
    
    // the rest of these will just send the params and let one method do the regex work for all of them
    if (self.txtScore1.highlighted) {
        
        NSString *tempString = self.txtScore1.text;
        
        NSString *test = [self CheckRegEx:digit textNumber:tempString];
        
        if (test.length > 0) {
            self.txtScore1.text = test;
        }
        
        if (self.txtScore1.text.length == 3 || [self.txtScore1.text isEqualToString:@"10"]) {
            [self.txtScore2 becomeFirstResponder];
            [self.txtScore2 setHighlighted:YES];
            [self.txtScore1 setHighlighted:NO];
            return;
        }
    }
    
    if (self.txtScore2.highlighted) {
        
        NSString *tempString = self.txtScore2.text;
        
        NSString *test = [self CheckRegEx:digit textNumber:tempString];
        
        if (test.length > 0) {
            self.txtScore2.text = test;
        }
        
        if (self.txtScore2.text.length == 3 || [self.txtScore2.text isEqualToString:@"10"]) {
            [self.txtScore3 becomeFirstResponder];
            [self.txtScore3 setHighlighted:YES];
            [self.txtScore2 setHighlighted:NO];
            return;
        }
    }
    
    if (self.txtScore3.highlighted) {
        
        NSString *tempString = self.txtScore3.text;
        
        NSString *test = [self CheckRegEx:digit textNumber:tempString];
        
        if (test.length > 0) {
            self.txtScore3.text = test;
        }
        
        if (self.txtScore3.text.length == 3 || [self.txtScore3.text isEqualToString:@"10"]) {
            [self.txtScore4 becomeFirstResponder];
            [self.txtScore4 setHighlighted:YES];
            [self.txtScore3 setHighlighted:NO];
            return;
        }
    }
    
    if (self.txtScore4.highlighted) {
        
        NSString *tempString = self.txtScore4.text;
        
        NSString *test = [self CheckRegEx:digit textNumber:tempString];
        
        if (test.length > 0) {
            self.txtScore4.text = test;
        }
        
        if (self.txtScore4.text.length == 3 || [self.txtScore4.text isEqualToString:@"10"]) {
            [self.txtScore5 becomeFirstResponder];
            [self.txtScore5 setHighlighted:YES];
            [self.txtScore4 setHighlighted:NO];
            return;
        }
    }
    
    if (self.txtScore5.highlighted) {
        
        NSString *tempString = self.txtScore5.text;
        
        NSString *test = [self CheckRegEx:digit textNumber:tempString];
        
        if (test.length > 0) {
            self.txtScore5.text = test;
        }
        
        if (self.txtScore5.text.length == 3 || [self.txtScore5.text isEqualToString:@"10"]) {
            [self.txtScore6 becomeFirstResponder];
            [self.txtScore6 setHighlighted:YES];
            [self.txtScore5 setHighlighted:NO];
            return;
        }
    }
    
    if (self.txtScore6.highlighted) {
        
        NSString *tempString = self.txtScore6.text;
        
        NSString *test = [self CheckRegEx:digit textNumber:tempString];
        
        if (test.length > 0) {
            self.txtScore6.text = test;
        }
        
        if (self.txtScore6.text.length == 3 || [self.txtScore6.text isEqualToString:@"10"]) {
            [self.txtScore7 becomeFirstResponder];
            [self.txtScore7 setHighlighted:YES];
            [self.txtScore6 setHighlighted:NO];
            return;
        }
    }
    
    if (self.txtScore7.highlighted) {
        
        NSString *tempString = self.txtScore7.text;
        
        NSString *test = [self CheckRegEx:digit textNumber:tempString];
        
        if (test.length > 0) {
            self.txtScore7.text = test;
        }
        
        if (self.txtScore7.text.length == 3 || [self.txtScore7.text isEqualToString:@"10"]) {
            [self.txtdd becomeFirstResponder];
            [self.txtdd setHighlighted:YES];
            [self.txtScore7 setHighlighted:NO];
            return;
        }
    }
}

// this checks the entry in the score boxes, only allow digit || 10, ., 0|5
-(NSString*)CheckRegEx:(NSString*)enteredNumber textNumber:(NSString*)textNumber {
    
    NSString *tempString = textNumber;
    NSRange range = NSRangeFromString([NSString stringWithFormat:@"{0:%lu}", (unsigned long)textNumber.length]);
    NSString *newString = [textNumber stringByReplacingCharactersInRange:range withString:enteredNumber];
    tempString = [tempString stringByAppendingString:newString];
    NSString *expression = @"^([0-9]|10{1}+)?(\\.([0|5]{1})?)?$";
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression options:NSRegularExpressionCaseInsensitive error:&error];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:tempString options:0 range:NSMakeRange(0, [tempString length])];
    if (numberOfMatches > 0) {
        
        return tempString;
    }
    
    return @"";
}

-(void)removeTextToolbar:(UITextInputAssistantItem*)textField {
    textField.leadingBarButtonGroups = @[];
    textField.trailingBarButtonGroups = @[];
}

@end
