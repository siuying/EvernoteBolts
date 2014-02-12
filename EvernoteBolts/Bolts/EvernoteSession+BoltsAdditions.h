//
//  EvernoteSession+BoltsAdditions.h
//  EvernoteBolts
//
//  Created by Francis Chong on 2/12/14.
//  Copyright (c) 2014 Ignition Soft. All rights reserved.
//

#import "EvernoteSession.h"
#import "Bolts.h"

@interface EvernoteSession (BoltsAdditions)

/** Authenticate, calling the given handler upon completion.
 
 This should be called to kick off the authentication process with Evernote.
 
 @param viewController The view controller that should be used to present the authentication view
 */
- (BFTask*)authenticateAsyncWithViewController:(UIViewController *)viewController;

@end
