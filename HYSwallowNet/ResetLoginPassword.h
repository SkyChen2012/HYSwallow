//
//  ResetLoginPassword.h
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "BaseRequestService.h"

@interface ResetLoginPassword : BaseRequestService

- (id)initWithuserName:(NSString *)userName 
                  code:(NSString *)code
              password:(NSString *)password;

@end
