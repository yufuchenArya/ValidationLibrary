//
//  InputValidationLibrary.h
//  InputValidationLibrary
//
//  Created by temp on 9/18/15.
//  Copyright (c) 2015 purnima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputValidationLibrary : NSObject

-(int)validateTextField: (NSString *)textfield withValue: (NSString *) textfieldValue asRequired: (BOOL) requireField
                  error: (NSString **) errorMessage;

-(int)validatePassword: (NSString *)passwordValue Confirmation: (NSString *)confirmPassword asRequired:(BOOL)requireField error: (NSString **)errorMessage;

-(BOOL) validatePresenceOfTextField: (NSString *) textField; //if has value returns TRUE else returns FALSE

-(BOOL) validateLengthOfTextField: (NSString *) textField; // if length between 2 - 15 returns TRUE else FALSE

-(BOOL)validateName:(NSString*)name; //Need for both firstname and lastname must start with an alphabet and only takes .,@_#-$; special characters and numbers "


-(BOOL)validateEmailAddress:(NSString *)email; //if a valid email address returns TRUE else returns FALSE

-(BOOL)validatePassword:(NSString *)password; // valid if it has atlest one Upper case one Lower case, one Number,one Sepecial Character and length must be between 6 to 20

//-(BOOL)validatePassword:(NSString*)password Confirmation:(NSString *) confirmPassword; //if both passwords matches then it returns True else False

-(BOOL) validatePhoneNumber: (NSString *)strPhoneNumber; // if  7 to 11, all numbers, no spaces or '-' returns TRUE else FALSE

-(NSString *)phoneNumberFormating: (NSString *)strPhoneNumber; // validates the phone number and formats it into phone number format and returns as a string


-(BOOL) validateDate:(NSString *) date; //if date is in mm/dd/yy format it returns YES else returns No

@end
