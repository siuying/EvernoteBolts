//
//  AppDelegate.m
//  EvernoteBolts
//
//  Created by Francis Chong on 2/12/14.
//  Copyright (c) 2014 Ignition Soft. All rights reserved.
//

#import "AppDelegate.h"
#import "EvernoteSDK.h"
#import "EvernoteNoteStore+BoltsAdditions.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    EvernoteNoteStore* notestore = [EvernoteNoteStore noteStore];
    [notestore getDefaultNotebookWithSuccess:^(EDAMNotebook *notebook) {
        EDAMNoteFilter* filter = [[EDAMNoteFilter alloc] init];
        filter.notebookGuid = notebook.guid;
        [notestore findNotesWithFilter:filter
                                offset:0
                              maxNotes:100
                               success:^(EDAMNoteList *list) {
                                   [[list notes] enumerateObjectsUsingBlock:^(EDAMNote* note, NSUInteger idx, BOOL *stop) {
                                       [notestore getNoteApplicationDataEntryWithGuid:note.guid key:@"MyData" success:^(NSString *entry) {
                                           // save the result
                                       } failure:^(NSError *error) {
                                           // error handling
                                       }];
                                   }];
                               } failure:^(NSError *error) {
                                   // error handling
                               }];
    } failure:^(NSError *error) {
        // error handling
    }];
    
    [[[[notestore getDefaultNotebookAsync] continueWithSuccessBlock:^id(BFTask *task) {
        EDAMNotebook *notebook = task.result;
        EDAMNoteFilter* filter = [[EDAMNoteFilter alloc] init];
        filter.notebookGuid = notebook.guid;
        return [notestore findNotesAsyncWithFilter:filter offset:0 maxNotes:100];
    }] continueWithSuccessBlock:^id(BFTask *task) {
        EDAMNoteList *list = task.result;
        NSMutableArray* tasks = [NSMutableArray array];
        [list.notes enumerateObjectsUsingBlock:^(EDAMNote* note, NSUInteger idx, BOOL *stop) {
            BFTask* subtask = [[notestore getNoteApplicationDataEntryAsyncWithGuid:note.guid key:@"MyData"] continueWithSuccessBlock:^id(BFTask *task) {
                // save the result
                return nil;
            }];
            [tasks addObject:subtask];
        }];
        return [BFTask taskForCompletionOfAllTasks:tasks];
    }] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            // error handling
        } else if (task.exception) {
            // exception handling
        } else {
            // task complete
        }
        return nil;
    }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
