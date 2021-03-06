//
//  DUV1000ViewController.m
//  ProgArt
//
//  Created by Oleksii Tiurenkov on 12/1/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import "DUV1000ViewController.h"
#import "HelpViewController.h"

@interface DUV1000ViewController ()

@end

@implementation DUV1000ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self addHelpButton];
    
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
    [VibroUtil vibrate];
    float angle = [self.angleTextField.text floatValue];
    if (angle == 0.0f)
    {
         [self errorHandling:self.angleTextField];
    }
    else
    {
        float height = [self.hieghtTextField.text floatValue];
        if (height == 0.0f)
        {
            [self errorHandling:self.hieghtTextField];
        }
        else
        {
            float distance = (height*1000)/angle;
            self.answerLabel.text = [NSString stringWithFormat:@"Расстояние = %1.4f",distance];
        }
    }
    [self tap:nil];
}

- (IBAction)calculateAngle:(id)sender
{
    [VibroUtil vibrate];
    float height = [self.hieghtTextField.text floatValue];
    if (height == 0.0f)
    {
        [self errorHandling:self.hieghtTextField];
    }
    else
    {
        float distance = [self.distanceTextField.text floatValue];
        if (distance == 0.0f)
        {
            [self errorHandling:self.distanceTextField];
        }
        else
        {
            float angle = (height*1000)/distance;
            self.answerLabel.text = [NSString stringWithFormat:@"Угол  = %1.4f",angle];
        }
    }
    [self tap:nil];

}

- (IBAction)calculateHeight:(id)sender
{
    [VibroUtil vibrate];
    float angle = [self.angleTextField.text floatValue];
    if (angle == 0.0f)
    {
         [self errorHandling:self.angleTextField];
    }
    else
    {
        float distance = [self.distanceTextField.text floatValue];
        if (distance == 0.0f)
        {
            [self errorHandling:self.distanceTextField];
        }
        else
        {
            float height = (distance*angle)/1000;
            self.answerLabel.text = [NSString stringWithFormat:@"Высота = %1.4f",height];
        }
    }
    [self tap:nil];
}

- (IBAction)tap:(UITapGestureRecognizer *)sender
{
    [self.angleTextField resignFirstResponder];
    [self.hieghtTextField resignFirstResponder];
    [self.distanceTextField resignFirstResponder];
}


- (void) errorHandling:(UITextField*)textField
{
    textField.backgroundColor = [UIColor redColor];

}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.backgroundColor = [UIColor whiteColor];
}

+ (UIViewController *)DUV1000Controller
{
    UIViewController* result = [[DUV1000ViewController  alloc] init];
    return result;
}
#pragma mark - Help Screens
- (void) addHelpButton
{
    UIBarButtonItem* helpItem = [[UIBarButtonItem alloc] initWithTitle:@"HELP" style:UIBarButtonItemStylePlain  target:self action:@selector(openHelpController)];
    self.navigationItem.rightBarButtonItem = helpItem;
}

- (void) openHelpController
{
    HelpViewController* helpController = [HelpViewController new];
    helpController.mainImagePNG = [UIImage imageNamed:@"puc_ogz"];
    helpController.text         = @"Подпрограмма предназначена для расчёта дальности, угла и высоты ориентира (цели).\n \
    Для проведения расчётов введите две известные величина из трёх и нажмите кнопку с названием той величины которую необходимо вычислить.\n \
    Например: необходимо найти Угол, вводим дальность до ориентира и высоту в соответствующие ячейки. \n \
    Далее нажимаем кнопку «Угол» и в нижней части экрана видим ответ.\n \
    ВНИМАНИЕ при вводе угла использовать точку ( если угол 0-15, то 0.15).";
    [self.navigationController pushViewController:helpController animated:YES];
}
@end
