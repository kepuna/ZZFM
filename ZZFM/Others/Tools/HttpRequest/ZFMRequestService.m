//
//  ZFMRequestService.m
//  ZZFM
//
//  Created by donews on 2018/7/24.
//  Copyright © 2018年 donews. All rights reserved.
//

#import "ZFMRequestService.h"
#import <AFNetworking/AFNetworking.h>

@interface ZFMRequestService()

@property (nonatomic, strong) AFHTTPRequestSerializer *httpRequestSerializer;

@end

@implementation ZFMRequestService

- (NSURLRequest *)requestWithParams:(NSDictionary *)params methodName:(NSString *)methodName requestType:(CTAPIManagerRequestType)requestType {
    if (requestType == CTAPIManagerRequestTypeGet) {
        NSMutableURLRequest *request = [self.httpRequestSerializer requestWithMethod:@"GET"
                                                                           URLString:methodName
                                                                          parameters:params
                                                                               error:nil];
        return request;
    } else if (requestType == CTAPIManagerRequestTypePost) {
        NSMutableURLRequest *request = [self.httpRequestSerializer requestWithMethod:@"POST"
                                                                           URLString:methodName
                                                                          parameters:params
                                                                               error:nil];
        return request;
    }
    
    return nil;
}

- (NSDictionary *)resultWithResponseData:(NSData *)responseData response:(NSURLResponse *)response request:(NSURLRequest *)request error:(NSError **)error
{
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
    result[kCTApiProxyValidateResultKeyResponseData] = responseData;
    result[kCTApiProxyValidateResultKeyResponseJSONString] = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    result[kCTApiProxyValidateResultKeyResponseJSONObject] = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:NULL];
    return result;
}


- (CTServiceAPIEnvironment)apiEnvironment
{
    return CTServiceAPIEnvironmentDevelop;
}

- (AFHTTPRequestSerializer *)httpRequestSerializer
{
    if (_httpRequestSerializer == nil) {
        _httpRequestSerializer = [AFHTTPRequestSerializer serializer];
        [_httpRequestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    return _httpRequestSerializer;
}

@synthesize apiEnvironment;

@end
