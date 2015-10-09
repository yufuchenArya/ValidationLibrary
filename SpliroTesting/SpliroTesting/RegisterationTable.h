//
//  RegisterationTable.h
//  SpliroTesting
//
//  Created by Brian Chen on 10/8/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterationTable : NSObject

@property(nonatomic, strong) NSString* cmd;
@property(nonatomic, strong) NSString* user_token;
@property(nonatomic, strong) NSString* language_code;
@property(nonatomic, strong) NSString* source_app;
@property(nonatomic, strong) NSString* user_device_id;
@property(nonatomic, strong) NSString* sim_serial_number;
@property(nonatomic, strong) NSString* device_mac_addr;
@property(nonatomic, strong) NSString* emei_meid_esn;
@property(nonatomic, strong) NSString* app_token;
@property(nonatomic, strong) NSString* device_id;
@property(nonatomic, strong) NSString* app_ver;
@property(nonatomic, strong) NSString* device_model;
@property(nonatomic, strong) NSString* device_density;
@property(nonatomic, strong) NSString* device_resolution;
@property(nonatomic, strong) NSString* os_type;
@property(nonatomic, strong) NSString* os_ver;
@property(nonatomic, strong) NSString* os_build_num;
@property(nonatomic, strong) NSString* sim_operator_nm;
@property(nonatomic, strong) NSString* sim_operator;
@property(nonatomic, strong) NSString* sim_network_operator;
@property(nonatomic, strong) NSString* sim_country_iso;
@property(nonatomic, strong) NSString* current_app_client_ver;
@property(nonatomic, strong) NSString* first_name;
@property(nonatomic, strong) NSString* last_name;
@property(nonatomic, strong) NSString* email;
@property(nonatomic, strong) NSString* pwd;
@property(nonatomic, strong) NSString* reg_type;
@property(nonatomic, strong) NSString* fb_user_id;
@property(nonatomic, strong) NSString* fb_access_token;
@property(nonatomic, strong) NSString* fb_expires;
@property(nonatomic, strong) NSString* fb_last_updated_on;
@property(nonatomic, strong) NSString* fb_post_enabled;

@end
