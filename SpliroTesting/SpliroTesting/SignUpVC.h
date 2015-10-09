//
//  SignUpVC.h
//  SpliroTesting
//
//  Created by Brian Chen on 10/6/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"
#import "RegisterationTable.h"
#import "AFURLRequestSerialization.h"

@interface SignUpVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField * tf_firstName;
@property (strong, nonatomic) IBOutlet UITextField * tf_lastName;
@property (strong, nonatomic) IBOutlet UITextField * tf_email;
@property (strong, nonatomic) IBOutlet UITextField * tf_password;

- (IBAction)btn_signUp:(id)sender;


@end
