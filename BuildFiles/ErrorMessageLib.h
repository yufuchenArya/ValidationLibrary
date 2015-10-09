//
//  ErrorMessageLib.h
//  ErrorMessageLib
//
//  Created by temp on 10/7/15.
//  Copyright © 2015 purnima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorMessageLib : NSObject

-(NSString *)errorMessageForPresence;

-(NSString *)errorMessageForLength;

-(NSString *)errorMessageForPhoneNumber;

-(NSString *)errorMessageForPassword;

-(NSString *)errorMessageForSpecialChar;

-(NSString *)errorMessageForEmailAddress;

-(NSString *)errorMessageForPasswordConfirmation;

@end
