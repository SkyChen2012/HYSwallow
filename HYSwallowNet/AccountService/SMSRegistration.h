//
//  SMSRegistration.h
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "BaseRequestService.h"

@interface SMSRegistration : BaseRequestService

- (id)initWithtelephone:(NSString *)telephone 
                smsType:(NSString *)smsType;

@end
