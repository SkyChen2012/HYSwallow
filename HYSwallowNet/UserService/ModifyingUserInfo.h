//
//  ModifyingUserInfo.h
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "BaseRequestService.h"

@interface ModifyingUserInfo : BaseRequestService

- (id)initWithuserId:(NSString *)userId
            password:(NSString *)password
               email:(NSString *)email
            nickName:(NSString *)nickName
              gender:(NSString *)gender;

@end
