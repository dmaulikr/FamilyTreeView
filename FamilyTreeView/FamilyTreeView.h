//
//  FamilyTreeView.h
//  FamilyTreeView
//
//  Created by ChenYun on 2017/7/25.
//  Copyright © 2017 ChenYun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonModel.h"
#import "PersonView.h"


@protocol FamilyTreeViewDelegate <NSObject>
- (void)personDidClick:(PersonModel *)model;
@end


@interface FamilyTreeView : UIView<UIScrollViewDelegate,PersonViewDelegate> {
    UIScrollView *mainScrollView;
    UIView *containerView;
    NSMutableDictionary *lastColumnsInRow;
    NSMutableArray *rowContainerViews;
}

@property (nonatomic, strong) PersonModel *model;
@property (nonatomic, weak) id<FamilyTreeViewDelegate> delegate;

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *personViewBackgroundColor;
@property (nonatomic, strong) UIColor *maleBorderColor;
@property (nonatomic, strong) UIColor *femaleBorderColor;

@end
