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
#import "Task.h"
#import "PGZ2ViewController.h"
#import "OGZ2ViewController.h"
#import "SNViewController.h"
#import "WGS84SK42ViewController.h"


@interface MainTableViewController ()
{
    NSArray* sections;
}
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    sections = @[
                 [[Task alloc] initTask:@"ДУВ1000"               WithController:[DUV1000ViewController DUV1000Controller]],
                 [[Task alloc] initTask:@"ПГЗ"                   WithController:[PGZ2ViewController new]],
                 [[Task alloc] initTask:@"ОГЗ"                   WithController:[OGZ2ViewController new]],
                 [[Task alloc] initTask:@"СН"                    WithController:[SNViewController   new]],
                 [[Task alloc] initTask:@"WGS84<=>СК42" WithController:[WGS84SK42ViewController new]]
//                 [[Task alloc] initTask:@"BL <=> XY"             WithController:[DUV1000ViewController DUV1000Controller]],
//                 [[Task alloc] initTask:@"WGS84 <=> CK42"        WithController:[DUV1000ViewController DUV1000Controller]],
//                 [[Task alloc] initTask:@"WGS84 <=> CK42 по GPS" WithController:[DUV1000ViewController DUV1000Controller]],
//                 [[Task alloc] initTask:@"Сближение меридиан"    WithController:[DUV1000ViewController DUV1000Controller]],
//                 [[Task alloc] initTask:@"Короткая база"         WithController:[DUV1000ViewController DUV1000Controller]],
//                 [[Task alloc] initTask:@"Засечки"               WithController:[DUV1000ViewController DUV1000Controller]],
//                 [[Task alloc] initTask:@"Расчёт угла солнца"    WithController:[DUV1000ViewController DUV1000Controller]],
//                 [[Task alloc] initTask:@"Перевод углов"         WithController:[DUV1000ViewController DUV1000Controller]],
//                 [[Task alloc] initTask:@"Помощь"                WithController:[DUV1000ViewController DUV1000Controller]]
                 ];
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
    cell.Label.text = ((Task*)sections[indexPath.row]).name;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:((Task*)sections[indexPath.row]).controller animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
