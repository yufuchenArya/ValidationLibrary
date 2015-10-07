//
//  Sp_mst_category+CoreDataProperties.h
//  SpliroTesting
//
//  Created by Brian Chen on 10/5/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Sp_mst_category.h"

NS_ASSUME_NONNULL_BEGIN

@interface Sp_mst_category (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *category_id;
@property (nullable, nonatomic, retain) NSDate *created_at;
@property (nullable, nonatomic, retain) NSString *desc;
@property (nullable, nonatomic, retain) NSString *hashtag;
@property (nullable, nonatomic, retain) NSNumber *id_number;
@property (nullable, nonatomic, retain) NSString *image_path;
@property (nullable, nonatomic, retain) NSString *keywords;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *parent_category_id;
@property (nullable, nonatomic, retain) NSString *parent_category_name;
@property (nullable, nonatomic, retain) NSString *pic_name;
@property (nullable, nonatomic, retain) NSString *pic_thumb_name;
@property (nullable, nonatomic, retain) NSString *pic_thumb_url;
@property (nullable, nonatomic, retain) NSString *pic_url;
@property (nullable, nonatomic, retain) NSString *status;
@property (nullable, nonatomic, retain) NSNumber *trno;
@property (nullable, nonatomic, retain) NSDate *updated_at;

@end

NS_ASSUME_NONNULL_END
