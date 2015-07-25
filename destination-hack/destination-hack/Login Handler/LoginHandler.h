//
//  LoginHandler.h
//  destination-hack
//
//  Created by Mohammed Lazim on 25/07/15.
//  Copyright © 2015 iostream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleSignIn/GoogleSignIn.h>
#import "SignInViewController.h"

@interface LoginHandler : NSObject<GIDSignInDelegate>
+ (id)sharedHandler;
- (void)startAuthenticating:(SignInViewController *)vc;
@end
