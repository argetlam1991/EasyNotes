//
//  Notes.h
//  EasyNotes
//
//  Created by Gu Han on 7/12/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotesDelegate.h"

@interface Notes : NSObject

- (void)configureDatabase;
- (NSArray *) getNotes;
- (NSString *) getNoteByIndex:(NSInteger)index;

@property (weak, nonatomic) NSObject<NotesDelegate> *delegate;

@end
