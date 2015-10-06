//
//  Sp_dta_post_user+CoreDataProperties.h
//  SpliroTesting
//
//  Created by Brian Chen on 10/5/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Sp_dta_post_user.h"

NS_ASSUME_NONNULL_BEGIN

@interface Sp_dta_post_user (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *created_at;
@property (nullable, nonatomic, retain) NSString *display_name;
@property (nullable, nonatomic, retain) NSNumber *id_number;
@property (nullable, nonatomic, retain) NSNumber *is_favorite;
@property (nullable, nonatomic, retain) NSNumber *is_invited;
@property (nullable, nonatomic, retain) NSNumber *migrated_user_id;
@property (nullable, nonatomic, retain) NSNumber *offer_price;
@property (nullable, nonatomic, retain) NSString *offer_remark;
@property (nullable, nonatomic, retain) NSNumber *offer_shares_approved;
@property (nullable, nonatomic, retain) NSNumber *offer_shares_requested;
@property (nullable, nonatomic, retain) NSNumber *offer_user_latitude;
@property (nullable, nonatomic, retain) NSNumber *offer_user_longitude;
@property (nullable, nonatomic, retain) NSString *post_contact_id;
@property (nullable, nonatomic, retain) NSString *post_contact_type;
@property (nullable, nonatomic, retain) NSString *post_guid;
@property (nullable, nonatomic, retain) NSNumber *post_id;
@property (nullable, nonatomic, retain) NSString *poster_share_status;
@property (nullable, nonatomic, retain) NSString *profile_pic_url;
@property (nullable, nonatomic, retain) NSNumber *rate;
@property (nullable, nonatomic, retain) NSString *status;
@property (nullable, nonatomic, retain) NSNumber *trno;
@property (nullable, nonatomic, retain) NSDate *updated_at;

@end

NS_ASSUME_NONNULL_END
