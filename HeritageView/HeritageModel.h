//
//  HeritageModel.h
//  HeritageView
//
//  Created by ChenYun on 2017/7/25.
//  Copyright © 2017 ChenYun. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum Gender: NSInteger {
    female,
    male
} Gender;


@interface HeritageModel : NSObject

@property(nonatomic,copy) NSString *personId;
@property(nonatomic,assign) Gender gender;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *birthday;
@property(nonatomic,copy) NSString *portraitUrl;
@property(nonatomic,copy) NSArray<HeritageModel *> *mates;
@property(nonatomic,copy) NSArray<HeritageModel *> *children; //Make children belong to a mate. A single parent is not supported yet.

@end
