//
//  AppDelegate.h
//  EasyNotes
//
//  Created by Gu Han on 7/11/17.
//  Copyright © 2017 Gu Han. All rights reserved.
//

#import <UIKit/UIKit.h>
@import UIKit;
@import Firebase;
@import GoogleSignIn;


@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

