//
//  InputValidationLib.h
//  InputValidationLib
//
//  Created by temp on 10/6/15.
//  Copyright © 2015 purnima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputValidationLib : NSObject


-(BOOL)validateTextfield: (NSString *)textfieldName asTextfieldType: (NSString  *) textfieldType withValue: (NSString *)textfieldValue asRequired: (BOOL) requireField error: (NSString **)errorMessage;

-(BOOL)validatePassword: (NSString *)passwordValue Confirmation: (NSString *)confirmPassword asRequired:(BOOL)requireField error: (NSString **)errorMessage;

-(NSString *)phoneNumberFormating: (NSString *)strPhoneNumber;

@end
