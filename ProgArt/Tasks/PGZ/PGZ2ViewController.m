//
//  PGZ2ViewController.m
//  ProgArt
//
//  Created by Aleksey Tyurenkov on 12/1/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import "PGZ2ViewController.h"
#import "VibroUtil.h"

@interface PGZ2ViewController ()
{
    UITextField* activeField;
}

@property (unsafe_unretained, nonatomic) IBOutlet UIScrollView *scrollView;

@end



@implementation PGZ2ViewController
@synthesize scrollView;


#pragma mark - Equation Resolving
- (IBAction)resolveEquation:(id)sender
{
    [self tap:nil];
    [VibroUtil vibrate];
    double xknp_pgz = [self.Xknp.text doubleValue];
    if (xknp_pgz == 0.0f)
    {
        [self errorHandling:self.Xknp];
        return;
    }
    double yknp_pgz = [self.YKnp.text doubleValue];
    if (yknp_pgz == 0.0f)
    {
        [self errorHandling:self.YKnp];
        return;
    }
    double hknp_pgz = [self.hKnp.text doubleValue];
    if (hknp_pgz == 0.0f)
    {
        [self errorHandling:self.hKnp];
        return;
    }
    double a_pgz = [self.AKnp.text doubleValue];
    if (a_pgz == 0.0f)
    {
        [self errorHandling:self.AKnp];
        return;
    }
    double d_pgz = [self.Dknp.text doubleValue];
    if (d_pgz == 0.0f)
    {
        [self errorHandling:self.Dknp];
        return;
    }
    double Mz_pgz = [self.Mc.text doubleValue];
    if (Mz_pgz == 0.0f)
    {
        [self errorHandling:self.Mc];
        return;
    }
    
    double xn_pgz = xknp_pgz+cos(a_pgz/(30/M_PI))*d_pgz;
    double yn_pgz = yknp_pgz+sin(a_pgz/(30/M_PI))*d_pgz;
    double hn_pgz= hknp_pgz+(((d_pgz*Mz_pgz/1000)*1.05)*100);
    
    self.labelHResult.text = [NSString stringWithFormat:@"%1.2f",hn_pgz];
    self.labelXResult.text = [NSString stringWithFormat:@"%1.2f",xn_pgz];
    self.labelYResult.text = [NSString stringWithFormat:@"%1.2f",yn_pgz];
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
