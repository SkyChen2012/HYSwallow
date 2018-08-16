//
//  DeleteGroup.m
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "DeleteGroup.h"

@interface DeleteGroup()
{
    __weak NSString *_groupId;
}
@end

@implementation DeleteGroup

- (id)initWithgroupId:(NSString *)groupId{
    self = [super init];
    if (self) {
        _groupId = groupId;
        
        
    }
    return self;
}

- (NSString *)requestUrl {
    return [TargetConfig_NetWork_s stringByAppendingString:@"/appUser/deleteGroup"];
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
             @"groupId":_groupId
             };
}

@end
