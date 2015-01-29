//
//  ViewController.m
//  DD Diving Calculator
//
//  Created by Jeremey Rodriguez on 1/27/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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
    
//    self.txtdd.layer.shadowColor = [UIColor blueColor].CGColor;
//    self.txtdd.layer.shadowOffset = CGSizeMake(.1f, .1f);
//    self.txtdd.layer.masksToBounds = NO;
//    self.txtdd.layer.shadowOpacity = .3;
//    self.txtdd.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
    
    
}

// only allow portrait in iphone
-(BOOL)shouldAutorotate {
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        return NO;
        
    } else {
        
        return YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClear:(id)sender {
}

- (IBAction)btnTotal:(id)sender {
}
@end
