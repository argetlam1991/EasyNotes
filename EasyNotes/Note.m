//
//  Note.m
//  EasyNotes
//
//  Created by Gu Han on 8/5/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "Note.h"


@implementation Note

- (Note *)initWithKey:(NSString *) key AndContent:(NSMutableDictionary *) content {
  self = [super init];
  if (self) {
    self.key = key;
    self.content = content;
  }
  return self;
}

- (void) updateNote:(NSString *)newNoteText {
  self.content[@"note"] = newNoteText;
}

- (NSString *) getNoteText {
  return self.content[@"note"];
}

@end
