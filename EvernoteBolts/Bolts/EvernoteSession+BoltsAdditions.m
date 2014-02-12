//
//  EvernoteSession+BoltsAdditions.m
//  EvernoteBolts
//
//  Created by Francis Chong on 2/12/14.
//  Copyright (c) 2014 Ignition Soft. All rights reserved.
//

#import "EvernoteSession+BoltsAdditions.h"

@implementation EvernoteSession (BoltsAdditions)

- (BFTask*)authenticateAsyncWithViewController:(UIViewController *)viewController
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self authenticateWithViewController:viewController completionHandler:^(NSError *error) {
        if (error) {
            [task setError:error];
        } else {
            [task setResult:nil];
        }
    }];
    return task.task;
}

@end
