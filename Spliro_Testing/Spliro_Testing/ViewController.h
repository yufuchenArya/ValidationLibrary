//
//  ViewController.h
//  Spliro_Testing
//
//  Created by Brian Chen on 10/14/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btn_coreData;
@property (weak, nonatomic) IBOutlet UIButton *btn_spliroAPI;
- (IBAction)btn_coreData:(id)sender;
- (IBAction)btn_spliroAPI:(id)sender;

@end

