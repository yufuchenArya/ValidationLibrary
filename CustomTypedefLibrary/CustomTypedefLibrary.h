//
//  CustomTypedefLibrary.h
//  CustomTypedefLibrary
//
//  Created by temp on 9/25/15.
//  Copyright © 2015 purnima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomTypedefLibrary : NSObject

typedef enum {
    
    TextFieldMinLength = 2,
    TextFieldMaxLength = 150
    
}TextFieldType;

typedef enum {
    
    TextAdressMinLength = 2,
    TextAdressMaxLength = 250
    
}TextAdressType;

typedef enum {
    
    TextDescMinLength = 2,
    TextDescMaxLength = 1000
    
}TextDescType;


typedef enum {
    
    TextPhoneMinLength = 7,
    TextPhoneMaxLength = 17
    
}TextPhoneType;

typedef enum {
    
    TextPasswordMinLength = 6,
    TextPasswordMaxLength = 20
    
}TextPasswordType;




@end
