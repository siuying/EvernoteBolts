# Bolts Tasks extension for Evernote iOS SDK 

Allow you to use BoltsFramework Tasks with Evernote API for iOS.

## Why?

Instead of nested callback like this:

```objective-c
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
```

You can write code like this:

```objective-c
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
```

### The Advantage

- More readable code.
- Easily write tasks that in series.
- Easily write tasks that in parallel.
- Cancellable task and dependency without the needs of subclassing NSOperation.

For more details about [BoltsFramework](https://github.com/BoltsFramework/Bolts-iOS), check their repo and [blog post](https://developers.facebook.com/blog/post/2014/01/30/let-s-bolt/).

## License

MIT License.