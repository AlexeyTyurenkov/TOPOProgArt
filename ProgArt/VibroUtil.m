//
//  VibroUtil.m
//  ProgArt
//
//  Created by Oleksii Tiurenkov on 12/2/14.
//  Copyright (c) 2014 Oleksii Tiurenkov. All rights reserved.
//

#import "VibroUtil.h"
#import <AudioToolbox/AudioToolbox.h>
@implementation VibroUtil
+ (void) vibrate
{
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}
@end
