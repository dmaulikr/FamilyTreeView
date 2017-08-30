//
//  PersonView.m
//  FamilyTreeView
//
//  Created by Yun Chen on 2017/7/29.
//  Copyright © 2017 ChenYun. All rights reserved.
//

#import "PersonView.h"


@interface PersonView () {
    UIColor *_maleBorderColor;
    UIColor *_femaleBorderColor;
}

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *birthdayLabel;
@property (nonatomic, weak) IBOutlet UIImageView *portraiImageView;

@end


@implementation PersonView

static const CGFloat kLeftMarginWithPortrait = 37.0;
static const CGFloat kLeftMargin = 3.0;
static const CGFloat kLabelWidthWithPortrait = 73.0;
static const CGFloat kLabelWidth = 108.0;


- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = 8.0;
    self.layer.borderWidth = 1.0;
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self addGestureRecognizer:gestureRecognizer];
}


#pragma mark - Properties
- (void)setZoomScale:(CGFloat)zoomScale {
    _zoomScale = zoomScale;
    
    if (zoomScale >= 1) {
        self.portraiImageView.hidden = NO;
        self.nameLabel.frame = CGRectMake(kLeftMarginWithPortrait, 0, kLabelWidthWithPortrait, 34);
        self.nameLabel.font = [UIFont boldSystemFontOfSize:15];
        self.nameLabel.text = self.model.name;
        self.nameLabel.textAlignment = NSTextAlignmentLeft;
        self.birthdayLabel.frame = CGRectMake(kLeftMarginWithPortrait, 33, kLabelWidthWithPortrait, 21);
        self.birthdayLabel.hidden = NO;
    }
    else if (zoomScale > 0.7) {
        self.portraiImageView.hidden = YES;
        self.nameLabel.frame = CGRectMake(kLeftMargin, 0, kLabelWidth, 34);
        self.nameLabel.font = [UIFont boldSystemFontOfSize:15];
        self.nameLabel.text = self.model.name;
        self.nameLabel.textAlignment = NSTextAlignmentLeft;
        self.birthdayLabel.frame = CGRectMake(kLeftMargin, 33, kLabelWidth, 21);
        self.birthdayLabel.hidden = NO;
    }
    else if (zoomScale > 0.3) {
        self.portraiImageView.hidden = YES;
        self.nameLabel.frame = CGRectMake(kLeftMargin, 0, self.frame.size.width - 6, self.frame.size.height);
        self.nameLabel.font = [UIFont boldSystemFontOfSize:30];
        self.nameLabel.text = self.model.name;
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.birthdayLabel.hidden = YES;
    }
    else{
        self.portraiImageView.hidden = YES;
        self.nameLabel.frame = CGRectMake(kLeftMargin, 0, self.frame.size.width - 6, self.frame.size.height);
        self.nameLabel.font = [UIFont boldSystemFontOfSize:30];
        if (self.model.name.length > 0) {
            self.nameLabel.text = [self.model.name substringToIndex:1];
        }
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.birthdayLabel.hidden = YES;
    }
}

- (void)setModel:(PersonModel *)model {
    _model = model;
    
    self.nameLabel.text = model.name;
    self.birthdayLabel.text = model.birthday;
    
    if (model.gender == male) {
        self.portraiImageView.highlighted = NO;
        self.layer.borderColor = self.maleBorderColor.CGColor;
    }
    else{
        self.portraiImageView.highlighted = YES;
        self.layer.borderColor = self.femaleBorderColor.CGColor;
    }
    
    if (model.portraitUrl != nil && model.portraitUrl.length > 0) {
        NSURL *url = [NSURL URLWithString:model.portraitUrl];
        if (url != nil) {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(queue, ^{
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
                if (image != nil) {
                    UIImage *cycImage = [self circleImageWithImage:image];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.portraiImageView.contentMode = UIViewContentModeScaleAspectFill;
                        self.portraiImageView.highlighted = NO;
                        self.portraiImageView.image = cycImage;
                    });
                }
            });
        }
    }
}

- (UIColor *)maleBorderColor {
    if (_maleBorderColor != nil) {
        return _maleBorderColor;
    }
    return [UIColor colorWithRed:131/255.0 green:166/255.0 blue:192/255.0 alpha:1.0];
}

- (UIColor *)femaleBorderColor {
    if (_femaleBorderColor != nil) {
        return _femaleBorderColor;
    }
    return [UIColor colorWithRed:240/255.0 green:140/255.0 blue:154/255.0 alpha:1.0];
}

- (void)setTextColor:(UIColor *)color {
    _textColor = color;
    self.nameLabel.textColor = _textColor;
    self.birthdayLabel.textColor = _textColor;
}

- (void)setMaleBorderColor:(UIColor *)color {
    _maleBorderColor = color;
    [self refreshBorderColor];
}

- (void)setFemaleBorderColor:(UIColor *)color {
    _femaleBorderColor = color;
    [self refreshBorderColor];
}


#pragma mark - Private Functions
- (void)refreshBorderColor {
    if (_model.gender == male) {
        self.layer.borderColor = self.maleBorderColor.CGColor;
    }
    else{
        self.layer.borderColor = self.femaleBorderColor.CGColor;
    }
}

- (UIImage *)circleImageWithImage:(UIImage *)image {
    CGFloat imageSide = fmin(image.size.width, image.size.height);
    CGSize imageSize = CGSizeMake(imageSide, imageSide);
    CGRect cropRect = CGRectMake(image.size.width / 2.0 - imageSize.width / 2.0, image.size.height / 2.0 - imageSize.height / 2.0, imageSize.width, imageSize.height);
    CGImageRef croppedCGImage = CGImageCreateWithImageInRect(image.CGImage, cropRect);
    UIImage *croppedImage =  [UIImage imageWithCGImage:croppedCGImage];
    CGImageRelease(croppedCGImage);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 1.0);
    CGRect bounds = CGRectMake(0, 0, imageSize.width, imageSize.height);
    [[UIBezierPath bezierPathWithRoundedRect:bounds cornerRadius:imageSize.width / 2.0] addClip];
    [croppedImage drawInRect:bounds];
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return finalImage;
}

- (void)tapAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(personViewDidClick:)]) {
        [self.delegate personViewDidClick:self];
    }
}


#pragma mark - Static Functions
+ (PersonView *)newInstance {
    if([[NSBundle mainBundle] pathForResource:@"PersonView" ofType:@"nib"] != nil)
    {
        return [[NSBundle mainBundle] loadNibNamed:@"PersonView" owner:self options:nil][0];
    }
    else{ //Load Xib from Pods bundle
        static NSBundle *podBundle;
        static NSURL *bundleURL;
        static NSBundle *bundle;
        if (podBundle == nil || bundleURL == nil || bundle == nil) {
            podBundle = [NSBundle bundleForClass:PersonView.class];
            bundleURL = [podBundle URLForResource:@"FamilyTreeView" withExtension:@"bundle"];
            if (bundleURL != nil) {
                bundle = [[NSBundle alloc] initWithURL:bundleURL];
            }
        }
        
        if (bundle != nil) {
            return [bundle loadNibNamed:@"PersonView" owner:self options:nil][0];
        }
        return nil;
    }
}


@end
