//
//  Notes.h
//  EasyNotes
//
//  Created by Gu Han on 7/12/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notes : NSObject

- (NSArray *) getNotes;
- (NSString *) getNoteByIndex:(NSInteger)index;

@end
