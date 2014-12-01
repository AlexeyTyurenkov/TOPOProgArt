//
//  Task.m
//  ProgArt
//
//  Created by Aleksey Tyurenkov on 12/1/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import "Task.h"

@implementation Task
- (instancetype)initTask:(NSString *)name WithController:(UIViewController *)controller
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.controller = controller;
        self.controller.title = name;
    }
    return self;
}
@end
