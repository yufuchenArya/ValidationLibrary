//
//  Sqlite_sequence+CoreDataProperties.h
//  Spliro_Testing
//
//  Created by Brian Chen on 10/14/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Sqlite_sequence.h"

NS_ASSUME_NONNULL_BEGIN

@interface Sqlite_sequence (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *seq;

@end

NS_ASSUME_NONNULL_END
