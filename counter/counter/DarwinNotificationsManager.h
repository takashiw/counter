//
//  DarwinNotificationsManager.h
//  counter
//
//  Created by Takashi Wickes on 3/9/17.
//  Copyright © 2017 takashiw. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef DarwinNotifications_h
#define DarwinNotifications_h

@interface DarwinNotificationsManager : NSObject

@property (strong, nonatomic) id someProperty;

+ (instancetype)sharedInstance;

- (void)registerForNotificationName:(NSString *)name callback:(void (^)(void))callback;
- (void)postNotificationWithName:(NSString *)name;
- (void)notificationCallbackReceivedWithName:(NSString *)name;


@end

#endif
