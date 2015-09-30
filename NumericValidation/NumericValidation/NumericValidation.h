//
//  NumericValidation.h
//  NumericValidation
//
//  Created by Brian Chen on 9/28/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NumericValidation : NSObject

-(BOOL) isNumber:(NSString *)value;
-(BOOL) positiveNumber:(NSString *) value;
-(BOOL) isRangedNumber:(NSString *) value :(NSString *)minValue :(NSString *)maxValue;
-(NSString *) decimalNumber:(NSString *) value :(NSInteger) numberOfDecimal;



@end
