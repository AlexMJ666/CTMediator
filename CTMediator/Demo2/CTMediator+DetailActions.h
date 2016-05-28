//
//  CTMediator+DetailActions.h
//  CTMediator
//
//  Created by yehot on 16/5/28.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "CTMediator.h"
#import <UIKit/UIKit.h>

@interface CTMediator (DetailActions)

- (UIViewController *)CTMediator_viewControllerForDetailWithParams:(NSDictionary *)dict;

@end
