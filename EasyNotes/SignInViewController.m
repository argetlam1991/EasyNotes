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

@end
