//
//  DUV1000ViewController.h
//  ProgArt
//
//  Created by Oleksii Tiurenkov on 12/1/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DUV1000ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UITextField *distanceTextField;
@property (weak, nonatomic) IBOutlet UITextField *angleTextField;
@property (weak, nonatomic) IBOutlet UITextField *hieghtTextField;
- (IBAction)calculateDistance:(UIButton *)sender;
- (IBAction)calculateAngle:(id)sender;
- (IBAction)calculateHeight:(id)sender;

+ (UIViewController*)DUV1000Controller;

@end
