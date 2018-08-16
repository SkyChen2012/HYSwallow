//
//  ViewController.m
//  HYSwallow
//
//  Created by Benson on 2018/8/15.
//  Copyright © 2018年 Benson. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Hash.h"

#import "BoneAddress.h"

#import "SMSRegistration.h"
#import "LogInApi.h"
#import "RefreshToken.h"
#import "Register.h"
#import "ResetLoginPassword.h"
//#import "HYSwallowNet.h"
@interface ViewController ()

@property (nonatomic, strong) NSDictionary *userDic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _userDic = @{
                 @"authCode":@"f0e2477eb3b463340276b7b5942e2f08",
                 @"randomKey":@"t4vj19",
                 @"token":@"eyJhbGciOiJIUzUxMiJ9.eyJyYW5kb21LZXkiOiJ0NHZqMTkiLCJzdWIiOiI1YzRkNTUyMC1iNWJhLTQzNjUtOWZhNS0zNjI4MTE2MDRhZGQiLCJleHAiOjE1MzUwMDIxMzMsImlhdCI6MTUzNDM5NzMzM30.Z9217eAVp3M6n8XG4CMNyy8B0y0LW7UrwhJQEZIJQavqco0hUxYGGlTrXYxHR0wO9RGrRk7qFS1z8lnh3GMbng",
                 @"userId":@"5c4d5520-b5ba-4365-9fa5-362811604add"
                 };
    
    BoneAddress *jj = [[BoneAddress alloc] init];
    [jj startWithCompletionBlockWithSuccess:^(__kindof HeroinBaseRequest * _Nonnull request) {
        NSLog(@"状态码%ld",request.responseStatusCode);
        NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
    } failure:^(__kindof HeroinBaseRequest * _Nonnull request) {
        NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
        NSLog(@"Error request = >%@",request);
    }];
}

-(NSArray *)operateTitleArray{
    return [NSArray arrayWithObjects:@"获取短信验证码", @"用户登陆", @"刷新Token",@"用户注册",@"重置登录密码",nil];
}

-(void)clickBtn:(UIButton *)btn{
    switch (btn.tag) {
        case 0:{
            [[[SMSRegistration alloc] initWithtelephone:@"18757150242" smsType:@"2"] startWithCompletionBlockWithSuccess:^(__kindof HeroinBaseRequest * _Nonnull request) {
                NSLog(@"状态码%ld",request.responseStatusCode);
                NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
            } failure:^(__kindof HeroinBaseRequest * _Nonnull request) {
                NSLog(@"Error request = >%@",request);
                NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
            }];
        }break;
        case 1:{
            [[[LogInApi alloc] initWithauthType:@"2" credence:@"18757150242" code:@"399961"] startWithCompletionBlockWithSuccess:^(__kindof HeroinBaseRequest * _Nonnull request) {
                NSLog(@"状态码%ld",request.responseStatusCode);
                NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
            } failure:^(__kindof HeroinBaseRequest * _Nonnull request) {
                NSLog(@"Error request = >%@",request);
                NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
            }];
            
        }break;
        case 2:{
            [[[RefreshToken alloc] initWithuserId:_userDic[@"userId"] token:_userDic[@"token"]] startWithCompletionBlockWithSuccess:^(__kindof HeroinBaseRequest * _Nonnull request) {
                NSLog(@"状态码%ld",request.responseStatusCode);
                NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
            } failure:^(__kindof HeroinBaseRequest * _Nonnull request) {
                NSLog(@"Error request = >%@",request);
                NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
            }];
        }break;
        case 3:{
            [[[Register alloc] initWithuserName:@"18757150242" code:@"" password:[@"" md5String] phone:nil email:nil nickName:nil gender:nil] startWithCompletionBlockWithSuccess:^(__kindof HeroinBaseRequest * _Nonnull request) {
                NSLog(@"状态码%ld",request.responseStatusCode);
                NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
            } failure:^(__kindof HeroinBaseRequest * _Nonnull request) {
                NSLog(@"Error request = >%@",request);
                NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
            }];
        }break;
        case 4:{    
            [[[ResetLoginPassword alloc] initWithuserName:@"18757150242" code:@"" password:[@"" md5String]] startWithCompletionBlockWithSuccess:^(__kindof HeroinBaseRequest * _Nonnull request) {
                NSLog(@"状态码%ld",request.responseStatusCode);
                NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
                
            } failure:^(__kindof HeroinBaseRequest * _Nonnull request) {
                NSLog(@"Error request = >%@",request);
                NSLog(@"%@",[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding]);
            }];
        }break;
        case 5:{
            
        }break;
        default:break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
