//
//  ErrorMessageLibrary.h
//  ErrorMessageLibrary
//
//  Created by temp on 9/20/15.
//  Copyright (c) 2015 purnima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorMessageLibrary : NSObject

-(NSString *)errorForValidatePresenceOfTextField:(id) textfield;
- (NSString *)errorForLength;
- (NSString *)errorForPhoneNumber;
- (NSString *)errorForPassword;
- (NSString *)errorForFirstAndLastName;
- (NSString *)errorForEmailAddress;
- (NSString *)errorForPasswordConfirmation;

@end
