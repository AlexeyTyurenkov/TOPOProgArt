//
//  HelpViewController.h
//  ProgArt
//
//  Created by Aleksey Tyurenkov on 12/3/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UILabel *helpText;
@property (strong, nonatomic) UIImage* mainImagePNG;
@property (strong, nonatomic) NSString* text;

@end
