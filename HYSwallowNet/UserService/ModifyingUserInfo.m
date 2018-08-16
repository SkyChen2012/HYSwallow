//
//  ModifyingUserInfo.m
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "ModifyingUserInfo.h"
#import "NSDictionary+JSONString.h"
@interface ModifyingUserInfo()
{
    __weak NSString *_userId;
    __weak NSString *_password;
    __weak NSString *_email;
    __weak NSString *_nickName;
    __weak NSString *_gender;
    
}
@end

@implementation ModifyingUserInfo

- (id)initWithuserId:(NSString *)userId
            password:(NSString *)password
               email:(NSString *)email
            nickName:(NSString *)nickName
              gender:(NSString *)gender{
    self = [super init];
    if (self) {
        _userId = userId;
        _password = password;
        _email = email;
        _nickName = nickName;
        _gender = gender;
    }
    return self;
}

- (NSString *)requestUrl {
    return [TargetConfig_NetWork_s stringByAppendingString:@"/appUser/modifyAppUser"];
}

- (HeroinRequestMethod)requestMethod {
    return HeroinRequestMethodPOST;
}

- (NSDictionary *)responseHeaders{
    return @{
             @"Content-Type":@"application/json"
             };
}

- (id)requestArgument{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:_userId forKey:@"userId"];
    if (_password) {
        [dic setValue:_password forKey:@"password"];
    }
    if (_email) {
        [dic setValue:_email forKey:@"email"];
    }
    if (_nickName) {
        [dic setValue:_nickName forKey:@"nickName"];
    }
    if (_gender) {
        [_gender setValue:_gender forKey:@"gender"];
    }
    
    return [dic JSONString];
}
@end
