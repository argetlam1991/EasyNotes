//
//  NoteTableViewCell.h
//  EasyNotes
//
//  Created by Gu Han on 7/12/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface NoteTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *NoteLabel;
@property (strong, nonatomic) Note *note;
@property (nonatomic) NSUInteger index;

- (void) receiveNote:(Note *) note;
@end
