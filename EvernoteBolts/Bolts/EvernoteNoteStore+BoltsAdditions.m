//
//  EvernoteNoteStore+BoltsAdditions.m
//  EvernoteBolts
//
//  Created by Francis Chong on 2/12/14.
//  Copyright (c) 2014 Ignition Soft. All rights reserved.
//

#import "EvernoteNoteStore+BoltsAdditions.h"

@implementation EvernoteNoteStore (BoltsAdditions)

- (BFTask*)getSyncStateAsync
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getSyncStateWithSuccess:^(EDAMSyncState *syncState) {
        [task setResult:syncState];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}


- (BFTask*)getSyncChunkAsyncAfterUSN:(int32_t)afterUSN
                       maxEntries:(int32_t)maxEntries
                     fullSyncOnly:(BOOL)fullSyncOnly
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getSyncChunkAfterUSN:afterUSN maxEntries:maxEntries fullSyncOnly:fullSyncOnly success:^(EDAMSyncChunk *syncChunk) {
        [task setResult:syncChunk];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getFilteredSyncChunkAsyncAfterUSN:(int32_t)afterUSN
                                  maxEntries:(int32_t)maxEntries
                                      filter:(EDAMSyncChunkFilter *)filter
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getFilteredSyncChunkAfterUSN:afterUSN maxEntries:maxEntries filter:filter success:^(EDAMSyncChunk *syncChunk) {
        [task setResult:syncChunk];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getLinkedNotebookSyncStateAsync:(EDAMLinkedNotebook *)linkedNotebook
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getLinkedNotebookSyncState:linkedNotebook success:^(EDAMSyncState *syncState) {
        [task setResult:syncState];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getLinkedNotebookSyncChunkAsync:(EDAMLinkedNotebook *)linkedNotebook
                                  afterUSN:(int32_t)afterUSN
                                maxEntries:(int32_t)maxEntries
                              fullSyncOnly:(BOOL)fullSyncOnly
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getLinkedNotebookSyncChunk:linkedNotebook afterUSN:afterUSN maxEntries:maxEntries fullSyncOnly:fullSyncOnly success:^(EDAMSyncChunk *syncChunk) {
        [task setResult:syncChunk];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)listNotebooksAsync
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self listNotebooksWithSuccess:^(NSArray *notebooks) {
        [task setResult:notebooks];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getNotebookAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getNotebookWithGuid:guid success:^(EDAMNotebook *notebook) {
        [task setResult:notebook];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getDefaultNotebookAsync
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getDefaultNotebookWithSuccess:^(EDAMNotebook *notebook) {
        [task setResult:notebook];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)createNotebookAsync:(EDAMNotebook *)notebook
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self createNotebook:notebook success:^(EDAMNotebook *notebook) {
        [task setResult:notebook];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)updateNotebookAsync:(EDAMNotebook *)notebook
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self updateNotebook:notebook success:^(int32_t usn) {
        [task setResult:@(usn)];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)expungeNotebookAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self expungeNotebookWithGuid:guid success:^(int32_t usn) {
        [task setResult:@(usn)];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)listTagsAsync
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self listTagsWithSuccess:^(NSArray *tags) {
        [task setResult:tags];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)listTagsAsyncByNotebookWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self listTagsByNotebookWithGuid:guid success:^(NSArray *tags) {
        [task setResult:tags];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getTagAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getTagWithGuid:guid success:^(EDAMTag *tag) {
        [task setResult:tag];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)createTagAsync:(EDAMTag *)tag
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self createTag:tag success:^(EDAMTag *tag) {
        [task setResult:tag];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)updateTagAsync:(EDAMTag *)tag
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self updateTag:tag success:^(int32_t usn) {
        [task setResult:@(usn)];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)untagAllAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self untagAllWithGuid:guid success:^{
        [task setResult:nil];
    } failure:^(NSError *error) {
        [task setError:nil];
    }];
    return task.task;
}

- (BFTask*)listSearchesAsync
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self listSearchesWithSuccess:^(NSArray *searches) {
        [task setResult:searches];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getSearchAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getSearchWithGuid:guid success:^(EDAMSavedSearch *search) {
        [task setResult:search];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)createSearchAsync:(EDAMSavedSearch *)search
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self createSearch:search success:^(EDAMSavedSearch *search) {
        [task setResult:search];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)updateSearchAsync:(EDAMSavedSearch *)search
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self updateSearch:search success:^(int32_t usn) {
        [task setResult:@(usn)];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)expungeSearchAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self expungeNotebookWithGuid:guid success:^(int32_t usn) {
        [task setResult:@(usn)];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)findRealtedAsyncWithQuery:(EDAMRelatedQuery *)query
                          resultSpec:(EDAMRelatedResultSpec *)resultSpec
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self findRealtedWithQuery:query resultSpec:resultSpec success:^(EDAMRelatedResult *result) {
        [task setResult:result];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)findNotesAsyncWithFilter:(EDAMNoteFilter *)filter
                             offset:(int32_t)offset
                           maxNotes:(int32_t)maxNotes
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self findNotesWithFilter:filter offset:offset maxNotes:maxNotes success:^(EDAMNoteList *list) {
        [task setResult:list];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)findNoteOffsetAsyncWithFilter:(EDAMNoteFilter *)filter
                                    guid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self findNoteOffsetWithFilter:filter guid:guid success:^(int32_t offset) {
        [task setResult:@(offset)];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)findNotesMetadataAsyncWithFilter:(EDAMNoteFilter *)filter
                                     offset:(int32_t)offset
                                   maxNotes:(int32_t)maxNotes
                                 resultSpec:(EDAMNotesMetadataResultSpec *)resultSpec
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self findNotesMetadataWithFilter:filter offset:offset maxNotes:maxNotes resultSpec:resultSpec success:^(EDAMNotesMetadataList *metadata) {
        [task setResult:metadata];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)findNoteCountsAsyncWithFilter:(EDAMNoteFilter *)filter
                               withTrash:(BOOL)withTrash
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self findNoteCountsWithFilter:filter withTrash:withTrash success:^(EDAMNoteCollectionCounts *counts) {
        [task setResult:counts];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getNoteAsyncWithGuid:(EDAMGuid)guid
                    withContent:(BOOL)withContent
              withResourcesData:(BOOL)withResourcesData
       withResourcesRecognition:(BOOL)withResourcesRecognition
     withResourcesAlternateData:(BOOL)withResourcesAlternateData
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getNoteWithGuid:guid withContent:withContent withResourcesData:withResourcesData withResourcesRecognition:withResourcesRecognition withResourcesAlternateData:withResourcesAlternateData success:^(EDAMNote *note) {
        [task setResult:note];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getNoteApplicationDataAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getNoteApplicationDataWithGuid:guid success:^(EDAMLazyMap *map) {
        [task setResult:map];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getNoteApplicationDataEntryAsyncWithGuid:(EDAMGuid)guid
                                                key:(NSString *)key
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getNoteApplicationDataEntryWithGuid:guid key:key success:^(NSString *entry) {
        [task setResult:entry];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)setNoteApplicationDataEntryAsyncWithGuid:(EDAMGuid)guid
                                                key:(NSString *)key
                                              value:(NSString *)value
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self setNoteApplicationDataEntryWithGuid:guid key:key value:value success:^(int32_t usn) {
        [task setResult:@(usn)];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)unsetNoteApplicationDataEntryAsyncWithGuid:(EDAMGuid)guid
                                                  key:(NSString *) key
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self unsetNoteApplicationDataEntryWithGuid:guid key:key success:^(int32_t usn) {
        [task setResult:@(usn)];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getNoteContentAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getNoteContentWithGuid:guid success:^(NSString *content) {
        [task setResult:content];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getNoteSearchTextAsyncWithGuid:(EDAMGuid)guid
                                 noteOnly:(BOOL)noteOnly
                      tokenizeForIndexing:(BOOL)tokenizeForIndexing
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getNoteSearchTextWithGuid:guid noteOnly:noteOnly tokenizeForIndexing:tokenizeForIndexing success:^(NSString *text) {
        [task setResult:text];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getResourceSearchTextAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getResourceSearchTextWithGuid:guid success:^(NSString *text) {
        [task setResult:text];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getNoteTagNamesAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getNoteTagNamesWithGuid:guid success:^(NSArray *names) {
        [task setResult:names];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)createNoteAsync:(EDAMNote *)note
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self createNote:note success:^(EDAMNote *note) {
        [task setResult:note];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)updateNoteAsync:(EDAMNote *)note
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self updateNote:note success:^(EDAMNote *note) {
        [task setResult:note];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)deleteNoteAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self deleteNoteWithGuid:guid success:^(int32_t usn) {
        [task setResult:@(usn)];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)copyNoteAsyncWithGuid:(EDAMGuid)guid
                  toNoteBookGuid:(EDAMGuid)toNotebookGuid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self copyNoteWithGuid:guid toNoteBookGuid:toNotebookGuid success:^(EDAMNote *note) {
        [task setResult:note];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)listNoteVersionsAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self listNoteVersionsWithGuid:guid success:^(NSArray *versions) {
        [task setResult:versions];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getNoteVersionAsyncWithGuid:(EDAMGuid)guid
                     updateSequenceNum:(int32_t)updateSequenceNum
                     withResourcesData:(BOOL)withResourcesData
              withResourcesRecognition:(BOOL)withResourcesRecognition
            withResourcesAlternateData:(BOOL)withResourcesAlternateData
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getNoteVersionWithGuid:guid updateSequenceNum:updateSequenceNum withResourcesData:withResourcesData withResourcesRecognition:withResourcesRecognition withResourcesAlternateData:withResourcesAlternateData success:^(EDAMNote *note) {
        [task setResult:note];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getResourceAsyncWithGuid:(EDAMGuid)guid
                           withData:(BOOL)withData
                    withRecognition:(BOOL)withRecognition
                     withAttributes:(BOOL)withAttributes
                  withAlternateDate:(BOOL)withAlternateData
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getResourceWithGuid:guid withData:withData withRecognition:withRecognition withAttributes:withAttributes withAlternateDate:withAlternateData success:^(EDAMResource *resource) {
        [task setResult:resource];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getResourceApplicationDataAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getResourceApplicationDataWithGuid:guid success:^(EDAMLazyMap *map) {
        [task setResult:map];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getResourceApplicationDataEntryAsyncWithGuid:(EDAMGuid)guid
                                                    key:(NSString *)key
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getResourceApplicationDataEntryWithGuid:guid key:key success:^(NSString *entry) {
        [task setResult:entry];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)setResourceApplicationDataEntryAsyncWithGuid:(EDAMGuid)guid
                                                    key:(NSString *)key
                                                  value:(NSString *)value
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self setResourceApplicationDataEntryWithGuid:guid key:key value:value success:^(int32_t usn) {
        [task setResult:@(usn)];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)unsetResourceApplicationDataEntryAsyncWithGuid:(EDAMGuid)guid
                                                      key:(NSString *)key
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self unsetResourceApplicationDataEntryWithGuid:guid key:key success:^(int32_t usn) {
        [task setResult:@(usn)];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)updateResourceAsync:(EDAMResource *)resource
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self updateResource:resource success:^(int32_t usn) {
        [task setResult:@(usn)];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getResourceDataAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getResourceDataWithGuid:guid success:^(NSData *data) {
        [task setResult:data];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getResourceByHashAsyncWithGuid:(EDAMGuid)guid
                              contentHash:(NSData *)contentHash
                                 withData:(BOOL)withData
                          withRecognition:(BOOL)withRecognition
                        withAlternateData:(BOOL)withAlternateData
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getResourceByHashWithGuid:guid contentHash:contentHash withData:withData withRecognition:withRecognition withAlternateData:withAlternateData success:^(EDAMResource *resource) {
        [task setResult:resource];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getResourceRecognitionAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getResourceRecognitionWithGuid:guid success:^(NSData *data) {
        [task setResult:data];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getResourceAlternateDataAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getResourceAlternateDataWithGuid:guid success:^(NSData *data) {
        [task setResult:data];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getResourceAttributesAsyncWithGuid:(EDAMGuid)guid
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getResourceAttributesWithGuid:guid success:^(EDAMResourceAttributes *attributes) {
        [task setResult:attributes];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)getPublicNotebookAsyncWithUserID:(EDAMUserID)userId
                                  publicUri:(NSString *)publicUri
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self getPublicNotebookWithUserID:userId publicUri:publicUri success:^(EDAMNotebook *notebook) {
        [task setResult:notebook];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)createSharedNotebookAsync:(EDAMSharedNotebook *)sharedNotebook
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self createSharedNotebook:sharedNotebook success:^(EDAMSharedNotebook *sharedNotebook) {
        [task setResult:sharedNotebook];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

- (BFTask*)sendMessageToSharedNotebookMembersAsyncWithGuid:(EDAMGuid)guid
                                               messageText:(NSString *)messageText
                                                recipients:(NSMutableArray *)recipients
{
    BFTaskCompletionSource *task = [BFTaskCompletionSource taskCompletionSource];
    [self sendMessageToSharedNotebookMembersWithGuid:guid messageText:messageText recipients:recipients success:^(int32_t numMessagesSent) {
        [task setResult:@(numMessagesSent)];
    } failure:^(NSError *error) {
        [task setError:error];
    }];
    return task.task;
}

@end
