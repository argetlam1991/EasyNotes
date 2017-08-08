//
//  ENTableViewController.m
//  EasyNotes
//
//  Created by Gu Han on 7/12/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "ENTableViewController.h"
#import "NoteTableViewCell.h"
#import "Notes.h"
#import "NoteHandler.h"

@interface ENTableViewController () <UITableViewDelegate, UITableViewDataSource, NotesDelegate>

@property (strong, nonatomic) Notes *notes;
@property (strong, nonatomic) IBOutlet UITableView *tableVIew;

@end

@implementation ENTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;
  
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  self.notes = [[Notes alloc] init];
  self.notes.delegate = self;
  [self.notes configureDatabase];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void) receiveNotesUpdateing {
  NSLog(@"receive updateing");
  [self.tableVIew reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSLog(@"row count: %lu", [self.notes getNotesCount]);
  return [self.notes getNotesCount];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NoteTableViewCell *cell = (NoteTableViewCell *)[self.tableVIew dequeueReusableCellWithIdentifier:@"NoteCell" forIndexPath:indexPath];
  // Configure the cell...
  NSLog(@"update view");
  cell.index = indexPath.row;
  
  [cell receiveNote:[self.notes getNoteAtIndex:indexPath.row]];
  NSLog(@"showed: %@", cell.NoteLabel.text);
  return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  id<NoteHandler> child = (id<NoteHandler>)[segue destinationViewController];
  [child receiveNotes:self.notes];

  if([sender isMemberOfClass:[UIBarButtonItem class]]) {
    //TO DO: add new Notes
    
  } else {
    NoteTableViewCell *source = (NoteTableViewCell *)sender;
    Note *item = source.note;
    [child receiveNote:item];
    [child receiveIndex:source.index];
  }
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
