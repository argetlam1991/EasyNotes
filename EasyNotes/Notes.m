//
//  Notes.m
//  EasyNotes
//
//  Created by Gu Han on 7/12/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "Notes.h"

@interface Notes ()

@property (strong, nonatomic) NSArray *notes;

@end

@implementation Notes

- (Notes *)init {
  self = [super init];
  if (self) {
    self.notes = @[@"notes1", @"notes2", @"notes3"];
  }
  return self;
}

- (NSArray *) getNotes {
  return self.notes;
}

- (NSString *) getNoteByIndex:(NSInteger)index {
  return self.notes[index];
}

@end
