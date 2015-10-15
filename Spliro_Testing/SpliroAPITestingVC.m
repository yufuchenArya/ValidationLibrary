//
//  SpliroAPITestingVC.m
//  Spliro_Testing
//
//  Created by Brian Chen on 10/14/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import "SpliroAPITestingVC.h"

@interface SpliroAPITestingVC ()

@end

@implementation SpliroAPITestingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _btn_signUp.layer.cornerRadius = 10;
    _btn_signUp.clipsToBounds = YES;
    
    hostURL = @"http://182.237.17.106:8080/spliro/sitedev/api/web/v2/index/index";
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

- (IBAction)btn_signUp:(id)sender {
    NSString * firstName = _lbl_firstName.text;
    NSString * lastName = _lbl_lastName.text;
    NSString * email = _lbl_email.text;
    NSString * password = _lbl_password.text;
    
    
    NSDictionary * params = @{@"data":@{
        @"cmd": @"signup_user",
        @"first_name": firstName,
        @"last_name": lastName,
        @"email": email,
        @"pwd": password,
        @"reg_type": @"s"
    }};
    
    AFNetworkingLibrary * postFunction = [[AFNetworkingLibrary alloc]init];
    NSData * responseObject = [postFunction POST:hostURL :params];
    NSLog(@"Response: %@", responseObject);
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                         options:kNilOptions
                                                           error:&error];
    
    NSArray* latestLoans = [json objectForKey:@"msg"];
    
    NSLog(@"loans: %@", latestLoans);
}
@end
