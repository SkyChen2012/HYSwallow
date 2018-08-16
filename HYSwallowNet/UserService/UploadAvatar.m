//
//  UploadAvatar.m
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "UploadAvatar.h"

@interface UploadAvatar()
{
    __weak NSString *_userId;
}
@end

@implementation UploadAvatar

- (id)initWithuserId:(NSString *)userId{
    self = [super init];
    if (self) {
        _userId = userId;
        
        
    }
    return self;
}

- (NSString *)requestUrl {
    return [TargetConfig_NetWork_s stringByAppendingString:@"/appUser/modifyHeadImge"];
}

- (HeroinRequestMethod)requestMethod {
    return HeroinRequestMethodPOST;
}

- (NSDictionary *)responseHeaders{
    return @{
             @"Content-Type":@"multipart/form-data"
             };
}

- (id)requestArgument{
    return @{
             @"userId":_userId
             };
}

@end
