//
//  DUV1000ViewController.m
//  ProgArt
//
//  Created by Oleksii Tiurenkov on 12/1/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import "DUV1000ViewController.h"

@interface DUV1000ViewController ()

@end

@implementation DUV1000ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)calculateDistance:(UIButton *)sender
{
    float angle = [self.angleTextField.text floatValue];
    if (angle == 0.0f)
    {
        NSLog(@"Error");
    }
    else
    {
        float height = [self.hieghtTextField.text floatValue];
        if (height == 0.0f)
        {
            NSLog(@"Error");
        }
        else
        {
            float distance = (height*1000)/angle;
            self.answerLabel.text = [NSString stringWithFormat:@"Расстояние = %1.4f",distance];
        }
    }
}

- (IBAction)calculateAngle:(id)sender
{
    float height = [self.hieghtTextField.text floatValue];
    if (height == 0.0f)
    {
        NSLog(@"Error");
    }
    else
    {
        float distance = [self.distanceTextField.text floatValue];
        if (distance == 0.0f)
        {
            NSLog(@"Error");
        }
        else
        {
            float angle = (height*1000)/distance;
            self.answerLabel.text = [NSString stringWithFormat:@"Угол  = %1.4f",angle];
        }
    }
}

- (IBAction)calculateHeight:(id)sender
{
    float angle = [self.angleTextField.text floatValue];
    if (angle == 0.0f)
    {
        NSLog(@"Error");
    }
    else
    {
        float distance = [self.distanceTextField.text floatValue];
        if (distance == 0.0f)
        {
            NSLog(@"Error");
        }
        else
        {
            float height = (distance*angle)/1000;
            self.answerLabel.text = [NSString stringWithFormat:@"Высота = %1.4f",height];
        }
    }

}

+ (UIViewController *)DUV1000Controller
{
    UIViewController* result = [[DUV1000ViewController  alloc] init];
    return result;
}
@end
