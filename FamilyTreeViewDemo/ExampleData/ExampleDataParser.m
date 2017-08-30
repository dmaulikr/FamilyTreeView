//
//  TestDataParser.m
//  FamilyTreeViewDemo
//
//  Created by ChenYun on 2017/7/27.
//  Copyright © 2017 ChenYun. All rights reserved.
//

#import "ExampleDataParser.h"
#import "YYModel.h"


@implementation ExampleDataParser

+ (PersonModel *)getExampleData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ExampleData" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    PersonModel *model = [PersonModel yy_modelWithJSON:json];
    return model;
}

@end
