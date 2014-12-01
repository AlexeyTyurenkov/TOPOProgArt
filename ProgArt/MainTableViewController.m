//
//  MainTableViewController.m
//  ProgArt
//
//  Created by Oleksii Tiurenkov on 12/1/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import "MainTableViewController.h"
#import "MainTableViewCell.h"
#import "DUV1000ViewController.h"

@interface MainTableViewController ()
{
    NSArray* sections;
}
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    sections = @[@"ДУВ1000"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [sections count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[MainTableViewCell reuseIdentifier] forIndexPath:indexPath];
    cell.Label.text = sections[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    UIViewController* controller = nil;
    switch (row)
    {
        case 0:
            controller = [DUV1000ViewController DUV1000Controller];
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:controller animated:YES];
}
@end
