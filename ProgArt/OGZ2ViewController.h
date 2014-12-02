//
//  PGZ2ViewController.h
//  ProgArt
//
//  Created by Aleksey Tyurenkov on 12/1/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OGZ2ViewController : UIViewController <UITextFieldDelegate>
- (IBAction)tap:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UITextField *Xknp;
@property (weak, nonatomic) IBOutlet UITextField *YKnp;
@property (weak, nonatomic) IBOutlet UITextField *hKnp;
@property (weak, nonatomic) IBOutlet UITextField *AKnp;
@property (weak, nonatomic) IBOutlet UITextField *Dknp;
@property (weak, nonatomic) IBOutlet UITextField *Mc;
@property (weak, nonatomic) IBOutlet UILabel *labelXResult;
@property (weak, nonatomic) IBOutlet UILabel *labelYResult;
@property (weak, nonatomic) IBOutlet UILabel *labelHResult;
- (IBAction)resolveEquation:(id)sender;
@property (unsafe_unretained, nonatomic) IBOutlet UIView *decisionView;

@end
