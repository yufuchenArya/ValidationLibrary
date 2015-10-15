//
//  CoreDataTestingVC.m
//  Spliro_Testing
//
//  Created by Brian Chen on 10/14/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import "CoreDataTestingVC.h"

@interface CoreDataTestingVC ()

@end

@implementation CoreDataTestingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self fetchingFromCoreData];
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

- (IBAction)btn_Save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *user = [NSEntityDescription insertNewObjectForEntityForName:@"Sp_dta_user" inManagedObjectContext:context];
    [user setValue:self.tf_displayName.text forKey:@"display_name"];
    [user setValue:self.tf_email.text forKey:@"email"];
    
    NSManagedObject *post = [NSEntityDescription insertNewObjectForEntityForName:@"Sp_dta_post" inManagedObjectContext:context];

    [post setValue:self.tf_title.text forKey:@"title"];
    [post setValue:self.tf_zipCode.text forKey:@"zipcode"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    [self fetchingFromCoreData];
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

-(void)fetchingFromCoreData{
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchUser = [[NSFetchRequest alloc] initWithEntityName:@"Sp_dta_user"];
    userArray = [[managedObjectContext executeFetchRequest:fetchUser error:nil] mutableCopy];
    
    NSFetchRequest *fetchPost = [[NSFetchRequest alloc] initWithEntityName:@"Sp_dta_post"];
    postArray = [[managedObjectContext executeFetchRequest:fetchPost error:nil] mutableCopy];
    
    [self.tableview reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return userArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellIdentifier = @"myCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSManagedObject *user = [userArray objectAtIndex:indexPath.row];
    NSManagedObject *post = [postArray objectAtIndex:indexPath.row];
    
    UILabel * name = (UILabel*)[cell viewWithTag:1];
    UILabel * email = (UILabel*)[cell viewWithTag:2];
    UILabel * title = (UILabel*)[cell viewWithTag:3];
    UILabel * zipcode = (UILabel*)[cell viewWithTag:4];
    
    name.text = [user valueForKey:@"display_name"];
    email.text = [user valueForKey:@"email"];
    
    title.text =[post valueForKey:@"title"];
    zipcode.text = [post valueForKey:@"zipcode"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete object from database
        [context deleteObject:[userArray objectAtIndex:indexPath.row]];
        [context deleteObject:[postArray objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        // Remove device from table view
        [userArray removeObjectAtIndex:indexPath.row];
        [postArray removeObjectAtIndex:indexPath.row];
        
        [self.tableview deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}






@end
