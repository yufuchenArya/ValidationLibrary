//
//  LogLibrary.m
//  LogLibrary
//
//  Created by temp on 9/23/15.
//  Copyright © 2015 purnima. All rights reserved.
//

#import "LogLibrary.h"

@implementation LogLibrary

-(void) writeToLogFile:(NSString *)content inFilePath:(NSString *)documentsDirectory
{
    
    
    // NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    if (documentsDirectory.length == 0) {
        NSString *defaultDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *folderPath = [defaultDirectory stringByAppendingPathComponent:@"ErrorLog"];
        
        documentsDirectory = folderPath;
    }
    
   // NSString *pathForLog = [documentsDirectory stringByAppendingPathComponent:@"RedirectedNSLogDocument.txt"];
   // freopen([pathForLog cStringUsingEncoding:NSASCIIStringEncoding],"a+",stderr);  //all NSLog statements will be added to this file
    
    NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"ErrorLog.txt"];
    
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    
    if ([filemgr fileExistsAtPath: fileName ] == YES)
    {
        NSLog (@"File exists");
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:fileName];
        
        if (fileHandle)
        {
            [fileHandle seekToEndOfFile];
            
            NSError * error = NULL;
            NSStringEncoding encoding;
            NSMutableString * fileContent = [[NSMutableString alloc] initWithContentsOfFile: fileName usedEncoding: &encoding error: &error];
            
            if(fileContent)
            {
                [fileContent appendFormat: @"\n %@ %@ ", [NSDate date] ,content];
                
                //save content to the documents directory
                BOOL success = [fileContent writeToFile:fileName
                                             atomically:YES
                                               encoding:NSStringEncodingConversionAllowLossy
                                                  error:&error];
             
                if(success == NO)
                    NSLog( @"couldn't write out file to %@, error is %@ \n", fileName, [error localizedDescription]);
                else NSLog(@"Content has been add to the file ");
            }
            [fileHandle closeFile];
        }
        
    }
    else
    {
        NSLog (@"File not found at %@", fileName);
        
        
        BOOL filecreated = [filemgr createFileAtPath:fileName
                                            contents:[content dataUsingEncoding:NSUTF8StringEncoding]
                                          attributes:nil];
        if (filecreated) NSLog(@"File has been created at %d", filecreated);
        
    }
}



@end
