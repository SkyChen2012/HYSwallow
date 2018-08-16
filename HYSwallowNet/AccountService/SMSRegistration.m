//
//  SMSRegistration.m
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "SMSRegistration.h"

@interface SMSRegistration()
{
    __weak NSString *_telephone;
    __weak NSString *_smsType;
}
@end

@implementation SMSRegistration

- (id)initWithtelephone:(NSString *)telephone 
                smsType:(NSString *)smsType{
    self = [super init];
    if (self) {
        _telephone = telephone;
        _smsType = smsType;
        
    }
    return self;
}

- (NSString *)requestUrl {
    return [TargetConfig_NetWork_s stringByAppendingString:@"/oauth/sms"];
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
        [formData appendPartWithFormData:[_telephone dataUsingEncoding:NSUTF8StringEncoding] name:@"telephone"];
        [formData appendPartWithFormData:[_smsType dataUsingEncoding:NSUTF8StringEncoding]  name:@"smsType"];
    };
}

@end
