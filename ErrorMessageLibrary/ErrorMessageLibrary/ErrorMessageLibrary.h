//
//  ErrorMessageLibrary.h
//  ErrorMessageLibrary
//
//  Created by temp on 9/20/15.
//  Copyright (c) 2015 purnima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorMessageLibrary : NSObject

- (NSString *)errorMessageForPresence;
- (NSString *)errorMessageForLength;
- (NSString *)errorMessageForPhoneNumber;
- (NSString *)errorMessageForPassword;
- (NSString *)errorMessageForSpecialChar;
- (NSString *)errorMessageForEmailAddress;
- (NSString *)errorMessageForPasswordConfirmation;

@end
