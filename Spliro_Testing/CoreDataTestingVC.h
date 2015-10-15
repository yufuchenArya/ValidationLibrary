//
//  CoreDataTestingVC.h
//  Spliro_Testing
//
//  Created by Brian Chen on 10/14/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sp_dta_post.h"
#import "Sp_dta_user.h"

@interface CoreDataTestingVC : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray * userArray;
    NSMutableArray * postArray;
}

- (IBAction)btn_Save:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *tf_displayName;
@property (weak, nonatomic) IBOutlet UITextField *tf_email;

@property (weak, nonatomic) IBOutlet UITextField *tf_title;
@property (weak, nonatomic) IBOutlet UITextField *tf_zipCode;

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end
