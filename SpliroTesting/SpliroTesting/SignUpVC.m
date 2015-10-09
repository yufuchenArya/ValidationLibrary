//
//  SignUpVC.m
//  SpliroTesting
//
//  Created by Brian Chen on 10/6/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import "SignUpVC.h"

@interface SignUpVC ()

@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    NSString * firstName, * lastName, * email, * password;
    
    firstName = _tf_firstName.text;
    lastName = _tf_lastName.text;
    email = _tf_email.text;
    password = _tf_password.text;
    
    [self sendingData:email :password :firstName :lastName];
}

-(void)sendingData:(NSString *)email :(NSString *)password :(NSString *)firstName :(NSString *)lastName{
    
    
    NSDictionary *params = @{@"data":@{@"cmd":@"signup_user",
                             @"email":email,
                             @"pwd":password,
                             @"last_name":lastName,
                             @"first_name":firstName,
                             @"user_token": @"",
                             @"language_code": @"en_us",
                             @"source_app": @"android",
                             @"user_device_id": @"-1",
                             @"sim_serial_number": @"89916047030000339989",
                             @"device_mac_addr": @"74:04:2b:c8:7c:ad",
                             @"emei_meid_esn": @"866225025689734",
                             @"app_token": @"AIzaSyDOm6g5fMoukRBjNEyeSzQ6U_ulE-D0aPU",
                             @"device_id": @"955ff461d314171e",
                             @"app_ver": @"vd00-01-023",
                             @"device_model": @"Lenovo A7000-a",
                             @"device_density": @"hdpi",
                             @"device_resolution": @"720x1280",
                             @"os_type": @"Linux",
                             @"os_ver": @"3.10.61",
                             @"os_build_num": @"Lenovo/aio_row/A7000-a:5.0/LRX21M/RA7000-a_S136_150519_ROW.05191840:user/release-keys",
                             @"sim_operator_nm": @"Vodafone IN",
                             @"sim_operator": @"40460",
                             @"sim_network_operator": @"40460",
                             @"sim_country_iso": @"in",
                             @"current_app_client_ver": @"1",
                             @"reg_type":@"s",
                             @"fb_user_id": @"1457199241249715",
                             @"fb_access_token": @"CAAUwgHZArIRgBANBK1QSSvWbZCs9eVAxeszNnRWzDHpFjoEHQSHY6aII6GDeGomd6ClYq7ySqzAS5XL53qsQBt4A6tZCF4V90PZAl4f98Th72F1L8Ti7oAqeT3HOkkyMiK5WzJkk1BCpZBMCCbAriC2ZBTuVACaKHwUA29oXWaZAvxYramb7q31sseNYQi5iMfXBepDDBIEGwyIZCzSm4ZAng",
                             @"fb_expires": @"1444365462482",
                             @"fb_last_updated_on": @"2015-01-06T05:09:27 0000",
                             @"fb_post_enabled": @"1"}
                             };
    
    NSString* HOST_URL = @"http://182.237.17.106:8080/spliro/sitedev/api/web/v2/index";
    
    [self POST:HOST_URL :params];
}

-(void)POST :(NSString*)HOST_URL :(NSDictionary*)params{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager POST:HOST_URL
       parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"JSON: %@ \n CurrentThread: %@", responseObject, [NSThread currentThread]);
              NSLog(@"%@", manager);
              
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: %@", error);
          }];
}

-(void)POSTMultiPart{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
    [manager POST:@"http://samwize.com/api/poo/"
       parameters:@{@"color": @"green"}constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    [formData appendPartWithFileURL:filePath name:@"image" error:nil];
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"Success: %@", responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
}
@end
