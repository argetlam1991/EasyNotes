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
    NSDictionary<NSString *, NSString *> *notes = snapshot.value;
    NSString *note = notes[@"note"];
    NSLog(@"received: %@", note);
    [self.notes addObject:note];
    NSLog(@"notes count: %lu", [self.notes count]);
    
    if (self.delegate) {
      [self.delegate receiveNotesUpdateing];
    }
  }];
}



- (NSArray *) getNotes {
  return self.notes;
}

- (NSString *) getNoteByIndex:(NSInteger)index {
  return self.notes[index];
}

@end
