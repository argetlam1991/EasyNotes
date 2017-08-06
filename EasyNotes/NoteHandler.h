//
//  NoteHandler.h
//  EasyNotes
//
//  Created by Gu Han on 7/18/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Notes.h"
#import "Note.h"
@protocol NoteHandler <NSObject>
- (void) receiveNote:(Note *) note;
- (void) receiveNotes:(Notes *) notes;
- (void) receiveIndex:(NSUInteger) index;
@end
