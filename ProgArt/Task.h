//
//  Task.h
//  ProgArt
//
//  Created by Aleksey Tyurenkov on 12/1/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Task : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) UIViewController* controller;

- (instancetype)initTask:(NSString*)name WithController:(UIViewController*)controller;
@end
