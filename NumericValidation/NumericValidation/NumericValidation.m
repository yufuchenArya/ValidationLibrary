//
//  NumericValidation.m
//  NumericValidation
//
//  Created by Brian Chen on 9/28/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import "NumericValidation.h"
#import "LogLibrary.h"

@implementation NumericValidation

- (BOOL) validateNumber:(NSString *) PositiveNumber{
    
    if (PositiveNumber >= 0) {
        
        return true;
    }
    
    return false;
//    [[[[LogLibrary]alloc]init] writeToLogFile:[exceptionString1 stringByAppendString: exceptionString2]stringByAppendString:exceptionString3]];
}


@end
