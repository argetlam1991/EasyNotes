//
//  NoteHandler.h
//  EasyNotes
//
//  Created by Gu Han on 7/18/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NoteHandler <NSObject>
- (void) receiveNote:(NSString *) note;
@end
