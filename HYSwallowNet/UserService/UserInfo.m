//
//  UserInfo.m
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "UserInfo.h"

@interface UserInfo()
{
    __weak NSString *_userId;
}
@end

@implementation UserInfo

- (id)initWithuserId:(NSString *)userId{
    self = [super init];
    if (self) {
        _userId = userId;
        
        
    }
    return self;
}

- (NSString *)requestUrl {
    return [TargetConfig_NetWork_s stringByAppendingString:@"/appUser/getAppUser"];
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
    return @{
             @"userId":_userId
             };
}

@end
