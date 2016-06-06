//
//  CTMediator+DetailActions.m
//  CTMediator
//
//  Created by yehot on 16/5/28.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "CTMediator+DetailActions.h"

//  target 是类名 Target_Detail.h
NSString * const kCTMediatorTargetDetail = @"Detail";

//  Action_NativeToDetailViewController
NSString * const kCTMediatorActionNativToDetailViewController = @"NativeToDetailViewController";

@implementation CTMediator (DetailActions)

/**
 *  这个Category利用Runtime调用我们刚刚生成的 Target_Detail,注意这个Category神奇的地方，由于利用了Runtime，
 
    导致我们完全不用#import刚刚生成的Target即可执行里面的方法，所以这一步，两个类是完全解耦的。
 
    *************** 这里虽然没有 import VC，但是 必须已字符串的形式，写死 VC 的类名
                    以字符串的形式，写死 Target_VC  中的函数名
 
    也即是说，我们在完全解耦的情况下生成了我们需要的ViewController。
 *
 */
- (UIViewController *)CTMediator_viewControllerForDetailWithParams:(NSDictionary *)dict
{
    UIViewController *viewController = [self performTarget:kCTMediatorTargetDetail
                                                    action:kCTMediatorActionNativToDetailViewController
                                                    params:dict];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

@end
