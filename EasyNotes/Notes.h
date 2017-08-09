//
//  Notes.h
//  EasyNotes
//
//  Created by Gu Han on 7/12/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotesDelegate.h"
#import "Note.h"


@interface Notes : NSObject

@property (weak, nonatomic) NSObject<NotesDelegate> *delegate;

- (void) configureDatabase;
- (NSUInteger) getNotesCount;
- (Note *) getNoteAtIndex:(NSUInteger) index;
- (void) updateNote:(Note *)note atIndex:(NSUInteger) index;
- (void) addNote:(Note *)note;
- (void) deleteNote:(Note *)note atIndex:(NSUInteger)index;

@end
