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
#import "HUserHandler.h"

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
        
        [self updateCurrentUserAccountWithGid:userId name:name email:email];
        
        NSDictionary *data = @{
                               @"gid": userId,
                               @"name": name,
                               @"email": email,
                               };
        
        
        [self sendRequestToServer:data];
        
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

#pragma mark - server request

- (void)sendRequestToServer:(NSDictionary *)dictionary{
    NSError *error;
    NSData *jsonData = [dictionary jsonData:&error];
    
    if(error){
        NSLog(@"JSON Error");
        return;
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/login", kHackServerUrl]];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    
    [urlRequest setHTTPBody:jsonData];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self startImmediately:YES];
    if(connection){
        NSLog(@"Request sent : %@", [NSString stringWithFormat:@"%@/login", kHackServerUrl]);
    }
    [LoaderView showLoaderViewFor:self];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [LoaderView hideLoaderViewFrom:self];
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSLog(@"Connection Response : %ld", (long)httpResponse.statusCode);
    if (httpResponse.statusCode != 200) {
        [_signinButton setHidden:NO];
        [LoaderView showFatalErrorFor:self text:@"Server Error, Try Later :("];
    }
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
    
    NSArray *userDetails = response[@"user"];
    NSInteger uid = [[userDetails objectAtIndex:0] integerValue];
    [self updateCurrentUserAccountWithUid:uid];
    
    [self showNextScreen:![response[@"exists"] boolValue]];
}
 

// This method receives the error report in case of connection is not made to server.
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Connection failed to : %@ with error : %@", [[connection.currentRequest URL] absoluteString], error);
    [_signinButton setHidden:NO];
    [LoaderView hideLoaderViewFrom:self];
    [LoaderView showFatalErrorFor:self text:@"Server Error, Try Later :("];
}

#pragma mark - login completed from g+
- (void)updateCurrentUserAccountWithGid:(NSString *)gid name:(NSString *)name email:(NSString *)email{
    HUserHandler *handler = [HUserHandler sharedHandler];
    handler.currentUser.googleId = gid;
    handler.currentUser.name = name;
    handler.currentUser.email = email;
}

#pragma mark - login completed from hack-server
- (void)updateCurrentUserAccountWithUid:(NSInteger)uid{
    HUserHandler *handler = [HUserHandler sharedHandler];
    handler.currentUser.userId = uid;
}

#pragma mark - Signin/Signup Completed
- (void)showNextScreen:(BOOL)showInterests{
    if(showInterests)
        [self userSignedUp];
    else
        [self userSignedIn];
}

- (void)userSignedIn{
    NSLog(@"Signin done");
    //directly to feed
}

- (void)userSignedUp{
     NSLog(@"Signup done");
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"LoginStoryboard" bundle:nil];
    UIViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"interestedScreen"];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
    //pushViewController:vc animated:YES];
}
 
@end
