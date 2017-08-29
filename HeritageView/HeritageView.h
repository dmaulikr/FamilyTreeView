//
//  HeritageView.h
//  HeritageView
//
//  Created by ChenYun on 2017/7/25.
//  Copyright © 2017 ChenYun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeritageModel.h"
#import "PersonView.h"


@protocol HeritageViewDelegate <NSObject>
- (void)personDidClick:(HeritageModel *)model;
@end


@interface HeritageView : UIView<UIScrollViewDelegate,PersonViewDelegate> {
    UIScrollView *mainScrollView;
    UIView *containerView;
    NSMutableDictionary *lastColumnsInRow;
    NSMutableArray *rowContainerViews;
}

@property (nonatomic, strong) HeritageModel *model;
@property (nonatomic, weak) id<HeritageViewDelegate> delegate;

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *personViewBackgroundColor;
@property (nonatomic, strong) UIColor *maleBorderColor;
@property (nonatomic, strong) UIColor *femaleBorderColor;

@end
