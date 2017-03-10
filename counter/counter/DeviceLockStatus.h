//
//  DeviceLockStatus.h
//  counter
//
//  Created by Takashi Wickes on 3/9/17.
//  Copyright © 2017 takashiw. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef DeviceLockStatus_h
#define DeviceLockStatus_h

@interface DeviceLockStatus : NSObject

@property (strong, nonatomic) id someProperty;

-(void)registerAppforDetectLockState;

@end

#endif /* DeviceLockStatus_h */
