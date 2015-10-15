//
//  AFNetworkingLibrary.m
//  AFNetworkingLibrary
//
//  Created by Brian Chen on 10/8/15.
//  Copyright © 2015 Brian Chen. All rights reserved.
//

#import "AFNetworkingLibrary.h"

@implementation AFNetworkingLibrary

-(NSData *)GET:(NSString*)HOST_URL{
    __block NSData * data;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:HOST_URL
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSLog(@"JSON: %@ \n CurrentThread: %@", responseObject, [NSThread currentThread]);
             data = [NSKeyedArchiver archivedDataWithRootObject:responseObject];
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
             data = [NSKeyedArchiver archivedDataWithRootObject:error];
         }];
    return data;
}

-(NSData *)POST :(NSString*)HOST_URL :(NSDictionary*)params{
    __block NSData * data;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:HOST_URL
       parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSLog(@"JSON: %@ \n CurrentThread: %@", responseObject, [NSThread currentThread]);
              data = [NSKeyedArchiver archivedDataWithRootObject:responseObject];
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: %@", error);
              data = [NSKeyedArchiver archivedDataWithRootObject:error];
          }];
    
    return data;
}

-(NSData *)POSTMultiPart :(NSString*)HOST_URL :(NSDictionary*)params :(NSString*)filePathString{
   __block NSData * data;

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSURL *filePath = [NSURL fileURLWithPath:filePathString];
    [manager POST:HOST_URL
       parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
           [formData appendPartWithFileURL:filePath name:@"image" error:nil];
       } success:^(AFHTTPRequestOperation *operation, id responseObject) {
           NSLog(@"Success: %@", responseObject);
           data = [NSKeyedArchiver archivedDataWithRootObject:responseObject];
       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
           NSLog(@"Error: %@", error);
           data = [NSKeyedArchiver archivedDataWithRootObject:error];
       }];
    
    return data;
}

-(NSData *)DownloadTask :(NSString *)downloadURL{
    __block NSData * data;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:downloadURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
        data = [NSKeyedArchiver archivedDataWithRootObject:filePath];
    }];
    [downloadTask resume];
    
    return data;
}

-(NSData *)UploadTask :(NSString *)uploadURL :(NSString *)uploadFilePath{
    __block NSData * data;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:uploadURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURL *filePath = [NSURL fileURLWithPath:uploadFilePath];
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithRequest:request fromFile:filePath progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            data = [NSKeyedArchiver archivedDataWithRootObject:error];
        } else {
            NSLog(@"Success: %@ %@", response, responseObject);
            data = [NSKeyedArchiver archivedDataWithRootObject:responseObject];
        }
    }];
    [uploadTask resume];
    
    return data;
}

@end
