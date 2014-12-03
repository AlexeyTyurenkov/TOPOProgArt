//
//  PGZ2ViewController.m
//  ProgArt
//
//  Created by Aleksey Tyurenkov on 12/1/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import "OGZ2ViewController.h"
#import "VibroUtil.h"
#import "HelpViewController.h"
@interface OGZ2ViewController ()
{
    UITextField* activeField;
}

@property (unsafe_unretained, nonatomic) IBOutlet UIScrollView *scrollView;

@end



@implementation OGZ2ViewController
@synthesize scrollView;


#pragma mark - Equation Resolving
- (IBAction)resolveEquation:(id)sender
{
    [self tap:nil];
    [VibroUtil vibrate];
    double xknp_ogz = [self.Xknp.text doubleValue];
    if (xknp_ogz == 0.0f)
    {
        [self errorHandling:self.Xknp];
        return;
    }
    double yknp_ogz = [self.YKnp.text doubleValue];
    if (yknp_ogz == 0.0f)
    {
        [self errorHandling:self.YKnp];
        return;
    }
    double hknp_ogz = [self.hKnp.text doubleValue];
    if (hknp_ogz == 0.0f)
    {
        [self errorHandling:self.hKnp];
        return;
    }
    double xzelu_ogz = [self.Xzelu.text doubleValue];
    if (hknp_ogz == 0.0f)
    {
        [self errorHandling:self.Xzelu];
        return;
    }
    double yzelu_ogz = [self.Yzelu.text doubleValue];
    if (hknp_ogz == 0.0f)
    {
        [self errorHandling:self.Yzelu];
        return;
    }
    double hzelu_ogz = [self.hzelu.text doubleValue];
    if (hknp_ogz == 0.0f)
    {
        [self errorHandling:self.hzelu];
        return;
    }
    
    
    double A_ogz = 0;
    double dx=xzelu_ogz-xknp_ogz;
    double dy=yzelu_ogz-yknp_ogz;
    
    double D_ogz=sqrt(dx*dx+dy*dy);
    
    double R= (acos(dx/D_ogz)*9.55);
    
    if(dy>0)
    {
        A_ogz = R;
    }
    else
    {
        A_ogz = 60 - R;
    }
    float Mz_ogz=(float) (asin((hzelu_ogz-hknp_ogz)/D_ogz)/M_PI*30);

    
    self.Aknpz.text = [NSString stringWithFormat:@"%1.2f",A_ogz];
    self.Dknpz.text = [NSString stringWithFormat:@"%1.2f",D_ogz];
    self.Mz.text = [NSString stringWithFormat:@"%1.2f",Mz_ogz];
    [scrollView scrollRectToVisible:self.decisionView.frame animated:YES];
}


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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self registerForKeyboardNotifications];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}


#pragma mark - KeyboardShowing
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    [scrollView scrollRectToVisible:activeField.superview.frame animated:YES];
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    [UIView animateWithDuration:0.4 animations:^{
        self.scrollView.contentInset = contentInsets;
    }];
    scrollView.scrollIndicatorInsets = contentInsets;
}

- (IBAction)tap:(id)sender
{
    [activeField resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    activeField = textField;
    textField.backgroundColor = [UIColor whiteColor];
    return YES;
}
#pragma mark - Error Handling
- (void) errorHandling:(UITextField*)textField
{
    textField.backgroundColor = [UIColor redColor];
    [scrollView scrollRectToVisible:textField.superview.frame animated:YES];
}
#pragma mark - Help Screen
- (void) addHelpButton
{
    UIBarButtonItem* helpItem = [[UIBarButtonItem alloc] initWithTitle:@"HELP" style:UIBarButtonItemStylePlain  target:self action:@selector(openHelpController)];
    self.navigationItem.rightBarButtonItem = helpItem;
}

- (void) openHelpController
{
    HelpViewController* helpController = [HelpViewController new];
    helpController.mainImagePNG = [UIImage imageNamed:@"puc_ogz"];
    helpController.text         = @"Подпрограмма предназначена для расчёта полярных координат ориентира (цели).\n \
    Для проведения расчётов введите координаты Х,У,h точки стояния (КНП, НП, КТ и т.д.), а также Х,У ориентира (цели, КТ).\n \
    Далее нажмите кнопку «Решить» и в нижней части экрана видим ответ.";
    [self.navigationController pushViewController:helpController animated:YES];
}
@end
