//
//  Note.h
//  EasyNotes
//
//  Created by Gu Han on 8/5/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Note : NSObject

@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSMutableDictionary *content;

- (Note *)initWithKey:(NSString *) key AndContent:(NSMutableDictionary *) content;
- (void) updateNote:(NSString *) newNoteText;
- (NSString *) getNoteText;

@end
