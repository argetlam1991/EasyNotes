//
//  EditorViewController.m
//  EasyNotes
//
//  Created by Gu Han on 7/18/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "EditorViewController.h"
#import "NoteHandler.h"


@interface EditorViewController () <NoteHandler, UITextViewDelegate>

@property (strong, nonatomic) Note *note;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) Notes *notes;
@property (nonatomic) NSUInteger index;
@property (nonatomic) BOOL modified;
@end

@implementation EditorViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.textView.delegate = self;
  self.modified = NO;
  if (self.note) {
    self.textView.text = [self.note getNoteText];
  }
}

- (void) viewWillDisappear:(BOOL)animated {
  if (self.modified) {
      [self saveNote];
  }

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void) receiveNotes:(Notes *)notes {
  self.notes = notes;
}

- (void) receiveNote:(Note *)note {
  self.note = note;
}

- (void) receiveIndex:(NSUInteger)index {
  self.index = index;
  
}

- (void) saveNote {
  NSString *noteText = self.textView.text;
  if (self.note) {
    [self.note updateNote:noteText];
    [self.notes updateNote:self.note atIndex:self.index];
  } else {
    if ([noteText length] > 0) {
      Note *note = [[Note alloc] initWithKey:nil AndContent:
                    [[NSMutableDictionary alloc] initWithDictionary:@{
                                                                      @"note": noteText
                                                                       }]];
      [self.notes addNote:note];
    }
  }
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
  self.modified = YES;
}

@end
