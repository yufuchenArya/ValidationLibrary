//
//  SpliroAPITestingVC.h
//  Spliro_Testing
//
//  Created by Brian Chen on 10/14/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworkingLibrary.h"

@interface SpliroAPITestingVC : UIViewController{
    NSString * hostURL;
}

@property (weak, nonatomic) IBOutlet UITextField *lbl_firstName;
@property (weak, nonatomic) IBOutlet UITextField *lbl_lastName;
@property (weak, nonatomic) IBOutlet UITextField *lbl_email;
@property (weak, nonatomic) IBOutlet UITextField *lbl_password;
@property (weak, nonatomic) IBOutlet UIButton *btn_signUp;

- (IBAction)btn_signUp:(id)sender;
@end
