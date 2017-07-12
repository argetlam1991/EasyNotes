//
//  SignInViewController.m
//  EasyNotes
//
//  Created by Gu Han on 7/11/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()

@property(strong, nonatomic) FIRAuthStateDidChangeListenerHandle handle;
@property (weak, nonatomic) IBOutlet GIDSignInButton *signInButton;

@end

@implementation SignInViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [GIDSignIn sharedInstance].uiDelegate = self;
  [[GIDSignIn sharedInstance] signInSilently];
  
  self.handle = [[FIRAuth auth]
                 addAuthStateDidChangeListener:^(FIRAuth * _Nonnull auth, FIRUser * _Nullable user) {
                   if (user) {
                     [self performSegueWithIdentifier:@"signInToENTable" sender:nil];
                   }
                 }];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
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
