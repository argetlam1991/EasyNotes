//
//  EditorViewController.m
//  EasyNotes
//
//  Created by Gu Han on 7/18/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "EditorViewController.h"
#import "NoteHandler.h"

@interface EditorViewController () <NoteHandler>
@property (strong, nonatomic) NSString *note;
@property (strong, nonatomic) IBOutlet UITextView *textView;


@end

@implementation EditorViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  if (self.note) {
      self.textView.text = self.note;
  }

  
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void) receiveNote:(NSString *)note {
  self.note = note;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
