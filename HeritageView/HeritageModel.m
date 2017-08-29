//
//  HeritageModel.m
//  HeritageView
//
//  Created by ChenYun on 2017/7/25.
//  Copyright © 2017 ChenYun. All rights reserved.
//

#import "HeritageModel.h"


@implementation HeritageModel

//For YYModel parsing.
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"mates" : HeritageModel.class,
             @"children" : HeritageModel.class };
}

@end
