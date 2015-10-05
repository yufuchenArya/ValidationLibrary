//
//  Sp_dta_post+CoreDataProperties.h
//  Spliro
//
//  Created by Brian Chen on 10/2/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Sp_dta_post.h"

NS_ASSUME_NONNULL_BEGIN

@interface Sp_dta_post (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *id_number;
@property (nullable, nonatomic, retain) NSNumber *post_id;
@property (nullable, nonatomic, retain) NSString *post_guid;
@property (nullable, nonatomic, retain) NSNumber *user_id;
@property (nullable, nonatomic, retain) NSString *status;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *desc;
@property (nullable, nonatomic, retain) NSNumber *category_id;
@property (nullable, nonatomic, retain) NSString *category_name;
@property (nullable, nonatomic, retain) NSString *post_hashtag;
@property (nullable, nonatomic, retain) NSString *keywords;
@property (nullable, nonatomic, retain) NSNumber *post_latitude;
@property (nullable, nonatomic, retain) NSNumber *post_longitude;
@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSString *zipcode;
@property (nullable, nonatomic, retain) NSString *pic_name;
@property (nullable, nonatomic, retain) NSString *pic_name_url;
@property (nullable, nonatomic, retain) NSString *pic_thumb;
@property (nullable, nonatomic, retain) NSString *pic_thumb_url;
@property (nullable, nonatomic, retain) NSNumber *total_share;
@property (nullable, nonatomic, retain) NSNumber *total_shares_left;
@property (nullable, nonatomic, retain) NSDate *post_expire_date;
@property (nullable, nonatomic, retain) NSDate *post_close_date;
@property (nullable, nonatomic, retain) NSNumber *invoice_price;
@property (nullable, nonatomic, retain) NSNumber *per_share_price;
@property (nullable, nonatomic, retain) NSString *invoice_image_name;
@property (nullable, nonatomic, retain) NSDate *created_at;
@property (nullable, nonatomic, retain) NSDate *updated_at;
@property (nullable, nonatomic, retain) NSString *category_img_path;
@property (nullable, nonatomic, retain) NSString *receipt_img_path;
@property (nullable, nonatomic, retain) NSString *display_name;
@property (nullable, nonatomic, retain) NSString *profile_pic_url;
@property (nullable, nonatomic, retain) NSString *rate;
@property (nullable, nonatomic, retain) NSNumber *total_joined;
@property (nullable, nonatomic, retain) NSNumber *is_invited;
@property (nullable, nonatomic, retain) NSNumber *is_favorite;
@property (nullable, nonatomic, retain) NSString *poster_zipcode;
@property (nullable, nonatomic, retain) NSString *selected_category;
@property (nullable, nonatomic, retain) NSNumber *poster_active_share_count;
@property (nullable, nonatomic, retain) NSNumber *is_browsed;
@property (nullable, nonatomic, retain) NSNumber *trno;

@end

NS_ASSUME_NONNULL_END
