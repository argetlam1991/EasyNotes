//
//  Notes.m
//  EasyNotes
//
//  Created by Gu Han on 7/12/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "Notes.h"

@import Firebase;

@interface Notes () {
  FIRDatabaseHandle _refHandle;
}

@property (strong, nonatomic) FIRDatabaseReference *ref;

@property (strong, nonatomic) NSMutableArray *notes;

@end

@implementation Notes

- (Notes *)init {
  self = [super init];
  if (self) {
    self.ref = [[FIRDatabase database] reference];
    self.notes = [[NSMutableArray alloc] init];
  }
  return self;
}

- (void)configureDatabase {
  self.ref = [[FIRDatabase database] reference];
  _refHandle = [[_ref child:@"notes"] observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot * _Nonnull snapshot)
  {
    Note * newNote = [[Note alloc] initWithKey:snapshot.key AndContent:snapshot.value ];
    [self.notes insertObject:newNote atIndex:0];
    if (self.delegate) {
      [self.delegate receiveNotesUpdateing];
    }
  }];
}

- (void) updateNote:(Note *)note atIndex:(NSUInteger)index{
  [[[_ref child:@"notes"] child:note.key] removeValue];
  [self.notes removeObjectAtIndex:index];
  [[[_ref child:@"notes"] childByAutoId] setValue:note.content];
}

- (void) addNote:(Note *)note {
  [[[_ref child:@"notes"] childByAutoId] setValue:note.content];
}

- (Note *) getNoteAtIndex:(NSUInteger)index {
  return self.notes[index];
}

- (NSUInteger) getNotesCount {
  return [self.notes count];
}

@end
