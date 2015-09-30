//
//  ViewController.m
//  InternetValidationTest
//
//  Created by temp on 9/22/15.
//  Copyright (c) 2015 purnima. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"


@interface ViewController ()

//@property Reachability *internetReachable, *hostReachable;
@property NetworkStatus networkStatus, hostStatus;
@property NSString * errorMessage;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

        if([self checkNetworkStatus] == NotReachable)
        {
            NSLog(@"Sorry Can not access the Web, No Internet Connection");
            
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:_errorMessage delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert show];
            
        }
        else
        {
            NSLog(@"Internet Connection is available, Enjoy your browsing");
        }
//
    // check for internet connection
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkNetworkStatus:) name:kReachabilityChangedNotification object:nil];
//    
//    Reachability *internetReachable = [Reachability reachabilityForInternetConnection];
//    NSLog(@"Internet Varification with Notification %d",[internetReachable startNotifier]);
//    
//    // check if a pathway to a random host exists
//    Reachability *hostReachable = [Reachability reachabilityWithHostName:@"www.apple.com"];
//    [hostReachable startNotifier];
//    
}


-(BOOL)checkNetworkStatus
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
  //  return NetworkStatus;
    
    switch (networkStatus)
    {
        case NotReachable:
        {
            _errorMessage =  @"The network is down is down. Please connect ot a network";
            self.networkStatus = NO;
            return networkStatus;
            break;
        }
        case ReachableViaWiFi:
        {
            _errorMessage =  @"The internet is working via WIFI.";
            self.networkStatus = YES;
            return networkStatus;
            break;
        }
        case ReachableViaWWAN:
        {
            _errorMessage = @"The internet is working via WWAN.";
            self.networkStatus = YES;
            return networkStatus;
            break;
        }
    }
            
    Reachability* hostReachable = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus hostStatus = [hostReachable currentReachabilityStatus];
    switch (hostStatus)
    {
        case NotReachable:
        {
            NSLog(@"A gateway to the host server is down.");
            self.hostStatus = NO;
            return hostStatus;
            break;
        }
        case ReachableViaWiFi:
        {
            NSLog(@"A gateway to the host server is working via WIFI.");
            self.hostStatus = YES;
            return hostStatus;
            break;
        }
        case ReachableViaWWAN:
        {
            NSLog(@"A gateway to the host server is working via WWAN.");
            self.hostStatus = YES;
            return hostStatus;
            break;
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
