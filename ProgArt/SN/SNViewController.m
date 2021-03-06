//
//  PGZ2ViewController.m
//  ProgArt
//
//  Created by Aleksey Tyurenkov on 12/1/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import "SNViewController.h"
#import "VibroUtil.h"
#import "HelpViewController.h"

@interface SNViewController ()
{
    UITextField* activeField;
}

@property (unsafe_unretained, nonatomic) IBOutlet UIScrollView *scrollView;

@end



@implementation SNViewController
@synthesize scrollView;


#pragma mark - Equation Resolving
- (IBAction)resolveEquation:(id)sender
{
    [self tap:nil];
    [VibroUtil vibrate];
    double xlev_sn = [self.XLev.text doubleValue];
    if (xlev_sn == 0.0f)
    {
        [self errorHandling:self.XLev];
        return;
    }
    double ylev_sn = [self.YLev.text doubleValue];
    if (ylev_sn == 0.0f)
    {
        [self errorHandling:self.YLev];
        return;
    }
    double xprav_sn = [self.XPrav.text doubleValue];
    if (xprav_sn == 0.0f)
    {
        [self errorHandling:self.XPrav];
        return;
    }
    double yprav_sn = [self.YPrav.text doubleValue];
    if (yprav_sn == 0.0f)
    {
        [self errorHandling:self.YPrav];
        return;
    }
    double alev_z_sn = [self.ALev.text doubleValue];
    if (alev_z_sn == 0.0f)
    {
        [self errorHandling:self.ALev];
        return;
    }
    double aprav_z_sn = [self.APrav.text doubleValue];
    if (aprav_z_sn == 0.0f)
    {
        [self errorHandling:self.APrav];
        return;
    }
    
    
    double Kp=(6 * M_PI / 180);
    double xop_sn = ((xlev_sn*tan(alev_z_sn*Kp)-ylev_sn)-(xprav_sn*tan(aprav_z_sn*Kp)-yprav_sn))/(tan(alev_z_sn*Kp)-tan(aprav_z_sn*Kp));
    double yop_sn = (xop_sn-xlev_sn)*tan(alev_z_sn*Kp)+ylev_sn;
    self.Xzelu.text = [NSString stringWithFormat:@"1.2%f",xop_sn];
    self.Yzelu.text = [NSString stringWithFormat:@"1.2%f",yop_sn];
    
    double dx_l= (xop_sn-xlev_sn);
    double dy_l= (yop_sn-ylev_sn);
    double D_l_z= sqrt(dx_l*dx_l+dy_l*dy_l);
    self.dlz.text = [NSString stringWithFormat:@"1.2%f",D_l_z];
    
    double dx_pr=(xop_sn-xprav_sn);
    double dy_pr= (yop_sn-yprav_sn);
    double D_pr_z= sqrt(dx_pr*dx_pr+dy_pr*dy_pr);
    self.dpc.text = [NSString stringWithFormat:@"1.2%f",D_pr_z];
    
    double dx_b= (xlev_sn-xprav_sn);
    double dy_b= (ylev_sn-yprav_sn);
    double baza= sqrt(dx_b*dx_b+dy_b*dy_b);
    self.base.text = [NSString stringWithFormat:@"1.2%f",baza];
	
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
#pragma mark - Help Screens
- (void) addHelpButton
{
    UIBarButtonItem* helpItem = [[UIBarButtonItem alloc] initWithTitle:@"HELP" style:UIBarButtonItemStylePlain  target:self action:@selector(openHelpController)];
    self.navigationItem.rightBarButtonItem = helpItem;
}

- (void) openHelpController
{
    HelpViewController* helpController = [HelpViewController new];
    helpController.mainImagePNG = [UIImage imageNamed:@"puc_sn"];
    helpController.text         = @"Подпрограмма предназначена для расчёта полярных координат ориентира (цели).\n \
    Для проведения расчётов введите координаты Х,У правого и левого пункта  (КНП, НП, КТ и т.д.), а также дирекционные углы на ориентира (цели, КТ) с правого и левого пункта.\n \
    Далее нажмите кнопку «Решить» и в нижней части экрана видим ответ.\n \
    ВНИМАНИЕ при вводе дирекционного угла ИСПОЛЬЗЫВАТЬ точку. Например, угол 12-80, то вводим 12.80.";
    [self.navigationController pushViewController:helpController animated:YES];
}
@end
