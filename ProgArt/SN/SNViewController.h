//
//  PGZ2ViewController.h
//  ProgArt
//
//  Created by Aleksey Tyurenkov on 12/1/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNViewController : UIViewController <UITextFieldDelegate>
- (IBAction)tap:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UITextField *XLev;
@property (weak, nonatomic) IBOutlet UITextField *YLev;
@property (weak, nonatomic) IBOutlet UITextField *ALev;

@property (weak, nonatomic) IBOutlet UITextField *XPrav;
@property (weak, nonatomic) IBOutlet UITextField *YPrav;
@property (weak, nonatomic) IBOutlet UITextField *APrav;





- (IBAction)resolveEquation:(id)sender;
@property (unsafe_unretained, nonatomic) IBOutlet UIView *decisionView;

@end
