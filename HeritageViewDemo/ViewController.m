//
//  ViewController.m
//  HeritageViewDemo
//
//  Created by ChenYun on 2017/7/25.
//  Copyright © 2017 ChenYun. All rights reserved.
//

#import "ViewController.h"
#import "ExampleDataParser.h"


@interface ViewController () <HeritageViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    HeritageModel *model = [ExampleDataParser getExampleData];  //get json data
    self.heritageView.model = model;                            //the heritage tree will be built after setting model
    self.heritageView.delegate = self;
    
    /* Simple data example
    HeritageModel *father = [[HeritageModel alloc] init];
    father.personId = @"d3k4fc";
    father.name = @"Laurence Chavis";
    father.gender = male;
    father.birthday = @"1/25/1935";
    father.portraitUrl = @"http://www.xxxx.com/images/d3k4fc_thumb.png";
     
    HeritageModel *mother = [[HeritageModel alloc] init];
    mother.personId = @"j8y6hd";
    mother.name = @"Myra Richards";
    mother.gender = female;
    mother.birthday = @"2/12/1930";
    
    HeritageModel *son = [[HeritageModel alloc] init];
    son.personId = @"ji9ke7";
    son.name = @"Laurence Chavis";
    son.gender = male;
    son.birthday = @"5/22/1952";
    
    mother.children = @[son];
    father.mates = @[mother];
    
    self.heritageView.model = father;
    */
    
    /* Customization
    self.heritageView.textColor = UIColor.whiteColor;
    self.heritageView.personViewBackgroundColor = UIColor.redColor;
    self.heritageView.femaleBorderColor = UIColor.yellowColor;
    self.heritageView.maleBorderColor = UIColor.greenColor;
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Heritage View Delegate
- (void)personDidClick:(HeritageModel *)model {
    NSLog(@"Person %@ did click",model.name);
}


@end
