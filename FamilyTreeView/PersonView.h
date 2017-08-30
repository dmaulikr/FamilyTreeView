//
//  PersonView.h
//  FamilyTreeView
//
//  Created by Yun Chen on 2017/7/29.
//  Copyright © 2017 ChenYun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonModel.h"


@class PersonView;


@protocol PersonViewDelegate <NSObject>
- (void)personViewDidClick:(PersonView *)personView;
@end


@interface PersonView : UIView

@property (nonatomic) CGFloat zoomScale;
@property (nonatomic, strong) PersonModel *model;

@property (nonatomic, assign) BOOL isMate;
@property (nonatomic, assign) BOOL isOriginalMate;
@property (nonatomic, copy) NSString *mateLinkId;
@property (nonatomic, copy) NSString *childLinkId;
@property (nonatomic, assign) BOOL isFirstChild;
@property (nonatomic, assign) BOOL isLastChild;

@property (nonatomic, weak) id<PersonViewDelegate> delegate;

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *maleBorderColor;
@property (nonatomic, strong) UIColor *femaleBorderColor;

+ (PersonView *)newInstance;

@end
