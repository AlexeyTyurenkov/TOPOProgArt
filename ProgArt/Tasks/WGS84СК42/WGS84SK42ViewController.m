//
//  WGS84СК42ViewController.m
//  ProgArt
//
//  Created by Aleksey Tyurenkov on 12/14/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import "WGS84SK42ViewController.h"


@interface WGS84SK42ViewController ()
{
    CLLocationManager *locationManager;
}


@end

@implementation WGS84SK42ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    

    // Do any additional setup after loading the view from its nib.
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    

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
- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", @"Core location has a position.");
    NSLog(@" lat: %f",newLocation.coordinate.latitude);
    [self setCoordinate:newLocation.coordinate.latitude ToTextFieldsForDegree:self.lattGrade forMinutes:self.lattMinutes forSeconds:self.lattSeconds];
    NSLog(@" lon: %f",newLocation.coordinate.longitude);
    [self setCoordinate:newLocation.coordinate.longitude ToTextFieldsForDegree:self.LongGrade forMinutes:self.longMinutes forSeconds:self.longSeconds];
    NSLog(@" alt: %f",newLocation.altitude);
    self.altitude.text = [NSString stringWithFormat:@"%i",(int)newLocation.altitude];
        [manager stopUpdatingLocation];
}
- (void) locationManager:(CLLocationManager *)manager
        didFailWithError:(NSError *)error
{
    NSLog(@"%@", @"Core location can't get a fix.");
}



- (IBAction)determineCoordinates:(UIButton *)sender {
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    [locationManager startUpdatingLocation];

}


- (void) setCoordinate:(CLLocationDegrees)coordinate ToTextFieldsForDegree:(UITextField*)tfDegree forMinutes:(UITextField*)minutes forSeconds:(UITextField*)seconds
{
    int latSeconds = (int)(coordinate * 3600);
    int latDegrees = latSeconds / 3600;
    latSeconds = ABS(latSeconds % 3600);
    int latMinutes = latSeconds / 60;
    latSeconds %= 60;
    
    tfDegree.text = [NSString stringWithFormat:@"%i",latDegrees];
    minutes.text = [NSString stringWithFormat:@"%i",latMinutes];
    seconds.text = [NSString stringWithFormat:@"%i",latSeconds];
}

- (IBAction)decision:(id)sender {
}
@end
