//
//  SignInViewController.m
//  destination-hack
//
//  Created by Mohammed Lazim on 25/07/15.
//  Copyright (c) 2015 iostream. All rights reserved.
//

#import "SignInViewController.h"
#import "defaults.h"
#import "LoginHandler.h"
#import "LoaderView.h"
#import "NSDictionary+JSON.h"

@interface SignInViewController ()<NSURLConnectionDataDelegate>{
    BOOL isSilentAuth;
}
@property (weak, nonatomic) IBOutlet GIDSignInButton *signinButton;

@end

@implementation SignInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //[GIDSignInButton class];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];

    // Do any additional setup after loading the view.
    [_signinButton setHidden:YES];
    [LoaderView showLoaderViewFor:self];
    isSilentAuth = YES;
    [[LoginHandler sharedHandler] startAuthenticating:self];
    //[self userSignedUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations on signed in user here.
    
    [LoaderView hideLoaderViewFrom:self];
    if(!user && error){
        NSLog(@"auth failed");
        [_signinButton setHidden:NO];
    }
    else{
        if(!isSilentAuth)
            [_signinButton setHidden:YES];
        
        NSString *userId = user.userID;                  // For client-side use only!
        NSString *idToken = user.authentication.idToken; // Safe to send to the server
        NSString *name = user.profile.name;
        NSString *email = user.profile.email;
        
        NSLog(@"LOGIN : %@, %@, %@, %@", userId, idToken, name, email);
        
        NSDictionary *data = @{
                               @"gid": userId,
                               @"fname": name,
                               @"email": email,
                               };
        
        
        [self sendRequestToServer:data];
        //Send server request
        /*
         
         signin?
         
         Signup?
         */
        
        //NSURLConnection
        //[self userSignedUp];
        
    }
    isSilentAuth = NO;

    
}

- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations when the user disconnects from app here.
    // ...
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)userSignedIn{
    //directly to feed
}

- (void)userSignedUp{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"LoginStoryboard" bundle:nil];
    UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"interestedScreen"];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
     //pushViewController:vc animated:YES];
}





#pragma mark - server request

- (void)sendRequestToServer:(NSDictionary *)dictionary{
    NSError *error;
    NSData *jsonData = [dictionary jsonData:&error];
    
    if(error){
        NSLog(@"JSON Error");
        return;
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/destihack/login", kHackServerUrl]];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    
    [urlRequest setHTTPBody:jsonData];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self startImmediately:YES];
    [LoaderView showLoaderViewFor:self];
    
}

// This method is used to receive the data which we get using post method.
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data{
    [LoaderView hideLoaderViewFrom:self];
    
    NSError *error;
    NSDictionary *response = [NSDictionary dictionaryFromJsonData:data error:&error];
    if(error){
        NSLog(@"JSON Error");
        return;
    }
    
}

// This method receives the error report in case of connection is not made to server.
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [_signinButton setHidden:NO];
    [LoaderView hideLoaderViewFrom:self];
    [LoaderView showFatalErrorFor:self text:@"Server Error, Try Later :("];
}

// This method is used to process the data after connection has made successfully.
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [LoaderView hideLoaderViewFrom:self];
}
@end
