//
//  ViewController.h
//  SpliroTesting
//
//  Created by Brian Chen on 10/5/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Sp_dta_user+CoreDataProperties.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    
    Sp_dta_user * dataUser;
}

@property (weak, nonatomic) IBOutlet UITextField * tf_name;
@property (weak, nonatomic) IBOutlet UITextField * tf_phone;
@property (weak, nonatomic) IBOutlet UITextField * tf_email;
@property (weak, nonatomic) IBOutlet UITextView * textV_aboutMe;
- (IBAction)btn_save:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableview_user;

@end

