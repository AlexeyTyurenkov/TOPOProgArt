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
@property (weak, nonatomic) IBOutlet UITextField *Xzelu;
@property (weak, nonatomic) IBOutlet UITextField *Yzelu;
@property (weak, nonatomic) IBOutlet UITextField *hzelu;


@property (weak, nonatomic) IBOutlet UILabel *Aknpz;
@property (weak, nonatomic) IBOutlet UILabel *Dknpz;
@property (weak, nonatomic) IBOutlet UILabel *Mz;

- (IBAction)resolveEquation:(id)sender;
@property (unsafe_unretained, nonatomic) IBOutlet UIView *decisionView;

@end
