//
//  LogInApi.h
//  HYSwallow
//
//  Created by Benson on 2018/8/15.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "BaseRequestService.h"

@interface LogInApi : BaseRequestService


- (id)initWithauthType:(NSString *)authType 
              credence:(NSString *)credence 
                  code:(NSString *)code;

@end
