//
//  Sp_dta_user+CoreDataProperties.h
//  Spliro_Testing
//
//  Created by Brian Chen on 10/14/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Sp_dta_user.h"

NS_ASSUME_NONNULL_BEGIN

@interface Sp_dta_user (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *about_me;
@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSDate *created_at;
@property (nullable, nonatomic, retain) NSString *display_name;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *first_name;
@property (nullable, nonatomic, retain) NSNumber *id_number;
@property (nullable, nonatomic, retain) NSNumber *is_favorite;
@property (nullable, nonatomic, retain) NSString *last_name;
@property (nullable, nonatomic, retain) NSString *location_country_code;
@property (nullable, nonatomic, retain) NSNumber *location_latitude;
@property (nullable, nonatomic, retain) NSNumber *location_longitude;
@property (nullable, nonatomic, retain) NSNumber *notify_pref;
@property (nullable, nonatomic, retain) NSString *phone;
@property (nullable, nonatomic, retain) NSNumber *poster_active_share_count;
@property (nullable, nonatomic, retain) NSString *profile_picture_name;
@property (nullable, nonatomic, retain) NSString *profile_picture_url;
@property (nullable, nonatomic, retain) NSNumber *rate;
@property (nullable, nonatomic, retain) NSString *selected_category;
@property (nullable, nonatomic, retain) NSString *status;
@property (nullable, nonatomic, retain) NSString *timezone;
@property (nullable, nonatomic, retain) NSNumber *trno;
@property (nullable, nonatomic, retain) NSNumber *user_id;
@property (nullable, nonatomic, retain) NSString *zipcode;

@end

NS_ASSUME_NONNULL_END
