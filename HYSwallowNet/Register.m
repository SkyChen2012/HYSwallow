//
//  Register.m
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "Register.h"

@implementation Register{
    __weak NSString *_userName;
    __weak NSString *_code;
    __weak NSString *_password;
    __weak NSString *_phone;
    __weak NSString *_email;
    __weak NSString *_nickName;
    __weak NSString *_gender;
}

- (id)initWithuserName:(NSString *)userName 
                  code:(NSString *)code
              password:(NSString *)password
                 phone:(NSString *)phone
                 email:(NSString *)email
              nickName:(NSString *)nickName
                gender:(NSString *)gender{
    self = [super init];
    if (self) {
        _userName = userName;
        _code = code;
        _password = password;
        _phone = phone;
        _email = email;
        _nickName = nickName;
        _gender = gender;
    }
    return self;
}

- (NSString *)requestUrl {
    return [TargetConfig_NetWork_s stringByAppendingString:@"/oauth/register"];
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
        if (_phone) {
            [formData appendPartWithFormData:[_phone dataUsingEncoding:NSUTF8StringEncoding] name:@"phone"];
        }
        
        if (_email) {
            [formData appendPartWithFormData:[_email dataUsingEncoding:NSUTF8StringEncoding] name:@"email"];
        }
        
        if (_nickName) {
            [formData appendPartWithFormData:[_nickName dataUsingEncoding:NSUTF8StringEncoding] name:@"nickName"];
        }
        if (_gender) {
            [formData appendPartWithFormData:[_gender dataUsingEncoding:NSUTF8StringEncoding] name:@"gender"];
        }
    };
}

@end
