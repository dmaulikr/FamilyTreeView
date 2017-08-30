//
//  PersonModel.m
//  FamilyTreeView
//
//  Created by ChenYun on 2017/7/25.
//  Copyright © 2017 ChenYun. All rights reserved.
//

#import "PersonModel.h"


@implementation PersonModel

//For YYModel parsing.
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"mates" : PersonModel.class,
             @"children" : PersonModel.class };
}

@end
