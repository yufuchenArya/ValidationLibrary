//
//  ViewController.m
//  Spliro_Testing
//
//  Created by Brian Chen on 10/14/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _btn_coreData.layer.cornerRadius = 10;
    _btn_coreData.clipsToBounds = YES;
    
    _btn_spliroAPI.layer.cornerRadius = 10;
    _btn_spliroAPI.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_coreData:(id)sender {
    [self performSegueWithIdentifier:@"coreData" sender:nil];
}

- (IBAction)btn_spliroAPI:(id)sender {
    [self performSegueWithIdentifier:@"spliroAPI" sender:nil];
}
@end
