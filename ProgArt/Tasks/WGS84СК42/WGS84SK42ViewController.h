//
//  WGS84СК42ViewController.h
//  ProgArt
//
//  Created by Aleksey Tyurenkov on 12/14/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WGS84SK42ViewController : UIViewController<CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UITextField *LongGrade;
@property (weak, nonatomic) IBOutlet UITextField *longMinutes;
@property (weak, nonatomic) IBOutlet UITextField *longSeconds;
@property (weak, nonatomic) IBOutlet UITextField *lattGrade;
@property (weak, nonatomic) IBOutlet UITextField *lattMinutes;
@property (weak, nonatomic) IBOutlet UITextField *lattSeconds;
@property (weak, nonatomic) IBOutlet UITextField *altitude;
- (IBAction)determineCoordinates:(UIButton *)sender;
- (IBAction)decision:(id)sender;



@end
