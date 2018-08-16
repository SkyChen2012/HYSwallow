//
//  BoneAddress.m
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "BoneAddress.h"

@implementation BoneAddress

- (NSString *)requestUrl {
    return @"http://bone.home.hongyancloud.com:8082/bonelist.js";
}

- (HeroinRequestMethod)requestMethod {
    return HeroinRequestMethodGET;
}


@end
