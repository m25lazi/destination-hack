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

- (instancetype)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

- (void)startAuthenticating{
    [GIDSignIn sharedInstance].clientID = kClientID;
    
}

@end
