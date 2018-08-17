//
//  ResetLoginPassword.m
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "ResetLoginPassword.h"

@interface ResetLoginPassword()
{
    __weak NSString *_userName;
    __weak NSString *_code;
    __weak NSString *_password;
}
@end

@implementation ResetLoginPassword

- (id)initWithuserName:(NSString *)userName 
                  code:(NSString *)code
              password:(NSString *)password{
    self = [super init];
    if (self) {
        _userName = userName;
        _code = code;
        _password = password;
    }
    return self;
}

- (NSString *)requestUrl {
    return [TargetConfig_NetWork_s stringByAppendingString:@"/oauth/modifyPwd"];
}

- (HeroinRequestMethod)requestMethod {
    return HeroinRequestMethodPOST;
}

- (NSDictionary *)responseHeaders{
    return @{
             @"Content-Type":@"multipart/form-data"
             };
}

- (AFConstructingBlock)constructingBodyBlock {
    return ^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFormData:[_userName dataUsingEncoding:NSUTF8StringEncoding] name:@"userName"];
        [formData appendPartWithFormData:[_code dataUsingEncoding:NSUTF8StringEncoding]  name:@"code"];
        [formData appendPartWithFormData:[_password dataUsingEncoding:NSUTF8StringEncoding] name:@"passeord"];
    };
}

@end

