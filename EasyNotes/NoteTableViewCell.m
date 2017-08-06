//
//  NoteTableViewCell.m
//  EasyNotes
//
//  Created by Gu Han on 7/12/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "NoteTableViewCell.h"

@interface NoteTableViewCell()


@end

@implementation NoteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) receiveNote:(Note *)note {
  self.note = note;
  [self updateView];
}

- (void) updateView {
  self.NoteLabel.text = [self.note getNoteText];
}

@end
