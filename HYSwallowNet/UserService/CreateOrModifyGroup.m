//
//  CreateOrModifyGroup.m
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "CreateOrModifyGroup.h"
#import "NSDictionary+JSONString.h"
@interface CreateOrModifyGroup()
{
    __weak NSString *_userId;
    __weak NSString *_groupId;
    __weak NSString *_groupName;
    __weak NSString *_groupIcon;
    NSInteger _acreage;
    __weak NSArray *_iotIdList;        
}
@end

@implementation CreateOrModifyGroup

- (id)initWithuserId:(NSString *)userId
             groupId:(NSString *)groupId
           groupName:(NSString *)groupName
           groupIcon:(NSString *)groupIcon
             acreage:(NSInteger)acreage
           iotIdList:(NSArray *)iotIdList{
    self = [super init];
    if (self) {
        _userId = userId;
        _groupId = groupId;
        _groupName = groupName;
        _groupIcon = groupIcon;
        _acreage = acreage;
        _iotIdList = iotIdList;
    }
    return self;
}

- (NSString *)requestUrl {
    return [TargetConfig_NetWork_s stringByAppendingString:@"/appUser/saveGroup"];
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
    [dic setValue:_groupName forKey:@"groupName"];
    [dic setValue:_groupIcon forKey:@"groupIcon"];
    [dic setObject:_iotIdList forKey:@"iotIdList"];
    
    if (_groupId) {
        [dic setValue:_groupId forKey:@"groupId"];
    }
    if (_acreage) {
        [dic setValue:[NSNumber numberWithInteger:_acreage] forKey:@"acreage"];
    }
    
    
    return [dic JSONString];
}
@end
