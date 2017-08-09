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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  NoteTableViewCell *cell = (NoteTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
  Note *toDelete = cell.note;
  [self.notes deleteNote:toDelete atIndex:indexPath.row];
  [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}

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

@end
