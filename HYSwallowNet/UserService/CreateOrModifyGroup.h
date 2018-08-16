//
//  CreateOrModifyGroup.h
//  HYSwallow
//
//  Created by Benson on 2018/8/16.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "BaseRequestService.h"

@interface CreateOrModifyGroup : BaseRequestService

- (id)initWithuserId:(NSString *)userId
             groupId:(NSString *)groupId
           groupName:(NSString *)groupName
           groupIcon:(NSString *)groupIcon
             acreage:(NSInteger)acreage
           iotIdList:(NSArray *)iotIdList;

@end
