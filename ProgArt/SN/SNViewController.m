//
//  PGZ2ViewController.m
//  ProgArt
//
//  Created by Aleksey Tyurenkov on 12/1/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import "SNViewController.h"
#import "VibroUtil.h"

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
    
    
    self.Aknpz.text = [NSString stringWithFormat:@"%1.2f",A_ogz];
    self.Dknpz.text = [NSString stringWithFormat:@"%1.2f",D_ogz];
    self.Mz.text = [NSString stringWithFormat:@"%1.2f",Mz_ogz];
    [scrollView scrollRectToVisible:self.decisionView.frame animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
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

@end
