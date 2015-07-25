//
//  LoginHandler.m
//  destination-hack
//
//  Created by Mohammed Lazim on 25/07/15.
//  Copyright © 2015 iostream. All rights reserved.
//

#import "LoginHandler.h"
#import <GoogleSignIn/GoogleSignIn.h>

static NSString * const kClientID =
@"204619250114-g98dnei4ea8nfuauf377ndovcocbttv4.apps.googleusercontent.com";

@implementation LoginHandler

+ (id)sharedHandler {
    static LoginHandler *sharedHandler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHandler = [[self alloc] init];
    });
    return sharedHandler;
}

- (void)startAuthenticating:(SignInViewController *)vc{
    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    if(signIn.currentUser){
        NSLog(@"User Logged in");
    }
    else{
        NSLog(@"No user Logged in");
        //show auth screen
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LoginStoryboard" bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"authScreen"];
        vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        //[self presentViewController:vc animated:YES completion:NULL];
    }
    
    signIn.shouldFetchBasicProfile = YES;
    signIn.delegate = vc;
    signIn.uiDelegate = vc;
    signIn.clientID = @"204619250114-g98dnei4ea8nfuauf377ndovcocbttv4.apps.googleusercontent.com";
    [signIn signInSilently];
}


- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations on signed in user here.
    NSString *userId = user.userID;                  // For client-side use only!
    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    NSString *name = user.profile.name;
    NSString *email = user.profile.email;
    
        
    NSLog(@"LOGIN : %@, %@, %@, %@", userId, idToken, name, email);
}
- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations when the user disconnects from app here.
    // ...
}

@end
