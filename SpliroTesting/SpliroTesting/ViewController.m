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
@synthesize myObject;
@synthesize userInfo;

NSUndoManager* undoManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    userInfo = [[NSMutableArray alloc]init];
    
    undoManager = [[NSUndoManager alloc] init];

    myObject.backgroundColor=[UIColor yellowColor];

    [self fetchInfo];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveInfo:(NSString *)displayName :(NSString *)phone :(NSString *)email :(NSString*)title :(NSString*)test{
    [[undoManager prepareWithInvocationTarget:self]
    saveInfo:displayName :phone :email :title :test];
    [undoManager setActionName:NSLocalizedString(@"Info Save", @"save undo")];
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
//    NSUndoManager *undoManager = [[NSUndoManager alloc] init];
//    [context setUndoManager:undoManager];
//    undoManager = [context undoManager];

    NSManagedObject *Sp_dta_user = [NSEntityDescription insertNewObjectForEntityForName:@"Sp_dta_user" inManagedObjectContext:context];

//    [undoManager beginUndoGrouping];

    [Sp_dta_user setValue:displayName forKey:@"display_name"];
    [Sp_dta_user setValue:phone forKey:@"phone"];
    [Sp_dta_user setValue:email forKey:@"email"];
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
//        [undoManager endUndoGrouping];
//        [undoManager undo];
    }
    
    NSLog(@"%s Name after set: %@", __PRETTY_FUNCTION__, [Sp_dta_user valueForKey:@"display_name"]);
//    [undoManager endUndoGrouping];
//    [undoManager undo];
    NSLog(@"%s Name after undo: %@", __PRETTY_FUNCTION__, [Sp_dta_user valueForKey:@"display_name"]);
    

//    else{
//
//        if (![self saveInfo2:title :test]) {
//            [self fetchInfo];
//            [undoManager endUndoGrouping];
//            [undoManager undo];
//        }
//    }
}

-(BOOL)saveInfo2:(NSString*)title :(NSString*)test{
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSUndoManager *undoManager = [[NSUndoManager alloc] init];
    undoManager = [context undoManager];

    NSManagedObject *Sp_dta_post = [NSEntityDescription insertNewObjectForEntityForName:@"Sp_dta_post" inManagedObjectContext:context];
    
    [Sp_dta_post setValue:title forKey:@"title"];
    [Sp_dta_post setValue:test forKey:@"zipcode"];
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        [undoManager endUndoGrouping];
        [undoManager undo];
        return true;
        }
    return false;
}

-(void)fetchInfo{
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Sp_dta_user"];
    userInfo = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.tableview_user reloadData];
    
}

- (IBAction)btn_save:(id)sender
{
  @try
 {
    NSString * name, *phone, *email, *error;
    
    name = self.tf_name.text;
    phone = self.tf_phone.text;
    email = self.tf_email.text;
    title = self.tf_title.text;
    test = self.tf_test.text;
 
    if( (! [[[InputValidationLib alloc]init] validateTextfield:@"Name" asTextfieldType:@"TextFieldType" withValue:name asRequired:YES error:& error]) ||
       (! [[[InputValidationLib alloc]init] validateTextfield:@"Phone" asTextfieldType:@"TextPhoneType" withValue:phone asRequired:YES error:& error]) ||
       (! [[[InputValidationLib alloc]init] validateTextfield:@"Email" asTextfieldType:@"TextEmailType" withValue:email asRequired:YES error:& error]))
    {
        NSLog(@"There is an error in the data: %@" ,error);
    }
    else
    {
        [self saveInfo:name :phone :email];
        [self fetchInfo];
    }
 }
    @catch(NSException *exception){
        NSLog(@"Excetion caught in  ");
    }
    @finally{
    
    }

- (IBAction)btn_undo:(id)sender {

    [undoManager undo];

}

- (IBAction)changeColor:(id)sender {
    [self setMyObjectColor:[UIColor blueColor]];
    

- (NSManagedObjectContext *)managedObjectContext {

    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)setMyObjectColor:(UIColor *)color {
    
    UIColor *currentColor = myObject.backgroundColor;
    
    if ((color != currentColor)) {
        [[undoManager prepareWithInvocationTarget:self]
         setMyObjectColor:currentColor];
        [undoManager setActionName:NSLocalizedString(@"Color Change", @"color undo")];
        myObject.backgroundColor=color;
        
    }
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

//- (void)testUndoManager
//{
//    NSDate *now = [NSDate date];
//    NSManagedObjectContext *moc = [self managedObjectContextWithConcurrencyType:NSConfinementConcurrencyType];
//    STAssertNil(moc.undoManager, @"undoManager is nil by default in iOS");
//    moc.undoManager = [[NSUndoManager alloc] init];
//    [moc.undoManager beginUndoGrouping];
//    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:EVENT_ENTITY_NAME inManagedObjectContext:moc];
//    STAssertNotNil(moc, @"Managed Object is nil");
//    STAssertEquals(moc, object.managedObjectContext,  @"MOC of object should be same as MOC");
//    STAssertNotNil(object.managedObjectContext.undoManager, @"undoManager of MOC should not be nil");
//    [object setValue:now forKey:@"timestamp"];
//    STAssertEqualObjects(now, [object valueForKey:@"timestamp"], @"Timestamp should be NOW");
//    [moc.undoManager endUndoGrouping];
//    STAssertEqualObjects(now, [object valueForKey:@"timestamp"], @"Timestamp should be NOW");
//    [moc.undoManager undo];
//    STAssertNil([object valueForKey:@"timestamp"], @"Object access should be nil because changes were undone");
//}


@end
