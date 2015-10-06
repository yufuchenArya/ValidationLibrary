//
//  ViewController.m
//  SpliroTesting
//
//  Created by Brian Chen on 10/5/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong) NSMutableArray *userInfo;
@end

@implementation ViewController
@synthesize userInfo;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    userInfo = [[NSMutableArray alloc]init];
    [self fetchInfo];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveInfo:(NSString *)displayName :(NSString *)phone :(NSString *)email{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *display_name = [NSEntityDescription insertNewObjectForEntityForName:@"Sp_dta_user" inManagedObjectContext:context];
    
    [display_name setValue:displayName forKey:@"display_name"];
    [display_name setValue:phone forKey:@"phone"];
    [display_name setValue:email forKey:@"email"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    //    [self dismissViewControllerAnimated:YES completion:nil];
    
    _tf_name.text = @"";
    _tf_email.text = @"";
    _tf_phone.text =@"";
    
}

-(void)fetchInfo{
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Sp_dta_user"];
    userInfo = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.tableview_user reloadData];
    
}


- (IBAction)btn_save:(id)sender {
    NSString * name, *phone, *email;
    
    name = self.tf_name.text;
    phone = self.tf_phone.text;
    email = self.tf_email.text;
    
    [self saveInfo:name :phone :email];
    [self fetchInfo];
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return userInfo.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier = @"myCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    UILabel * name = (UILabel *)[cell viewWithTag:1];
    UILabel * phone = (UILabel *)[cell viewWithTag:2];
    UILabel * email = (UILabel *)[cell viewWithTag:3];
    
    name.text = [userInfo valueForKey:@"display_name"][indexPath.row];
    phone.text = [userInfo valueForKey:@"phone"][indexPath.row];
    email.text = [userInfo valueForKey:@"email"][indexPath.row];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    NSManagedObjectContext *context = [self managedObjectContext];

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [context deleteObject:[self.userInfo objectAtIndex:indexPath.row]];
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
    }
    [self.userInfo removeObjectAtIndex:indexPath.row];
    [self.tableview_user deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
