//
//  ListGroup.m
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "ListGroup.h"
#import "NSDictionary+JSONString.h"

@interface ListGroup()
{
    __weak NSString *_userId;
}
@end

@implementation ListGroup

- (id)initWithuserId:(NSString *)userId{
    self = [super init];
    if (self) {
        _userId = userId;
    }
    return self;
}

- (NSString *)requestUrl {
    return [TargetConfig_NetWork_s stringByAppendingString:@"/appUser/listGroup"];
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
    
    return [dic JSONString];
}
@end
