//
//  LogLibrary.h
//  LogLibrary
//
//  Created by temp on 9/23/15.
//  Copyright © 2015 purnima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogLibrary : NSObject

-(void) writeToLogFile:(NSString *)content inFilePath:(NSString *)documentsDirectory;

-(void)writeExceptionToLogFile:( NSException *)exception fromClass:(NSString *)fromClass fromMethod:(NSString *)methodName;

//To write an exception in any try catch block you can use this method 'writeExceptionToLogFile'.

@end
