//
//  ViewController.m
//  FamilyTreeViewDemo
//
//  Created by ChenYun on 2017/7/25.
//  Copyright © 2017 ChenYun. All rights reserved.
//

#import "ViewController.h"
#import "ExampleDataParser.h"


@interface ViewController () <FamilyTreeViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PersonModel *model = [ExampleDataParser getExampleData];  //get json data
    self.familyTreeView.model = model;                        //the familyTree tree will be built after setting model
    self.familyTreeView.delegate = self;
    
    /* Simple data example
     PersonModel *father = [[PersonModel alloc] init];
     father.personId = @"d3k4fc";
     father.name = @"Laurence Chavis";
     father.gender = male;
     father.birthday = @"1/25/1935";
     father.portraitUrl = @"http://www.xxxx.com/images/d3k4fc_thumb.png";
     
     PersonModel *mother = [[PersonModel alloc] init];
     mother.personId = @"j8y6hd";
     mother.name = @"Myra Richards";
     mother.gender = female;
     mother.birthday = @"2/12/1930";
     
     PersonModel *son = [[PersonModel alloc] init];
     son.personId = @"ji9ke7";
     son.name = @"Laurence Chavis";
     son.gender = male;
     son.birthday = @"5/22/1952";
     
     mother.children = @[son];
     father.mates = @[mother];
     
     self.familyTreeView.model = father;
    */
    
    /* Customization
     self.familyTreeView.textColor = UIColor.whiteColor;
     self.familyTreeView.personViewBackgroundColor = UIColor.redColor;
     self.familyTreeView.femaleBorderColor = UIColor.yellowColor;
     self.familyTreeView.maleBorderColor = UIColor.greenColor;
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Family Tree View Delegate
- (void)personDidClick:(PersonModel *)model {
    NSLog(@"Person %@ did click",model.name);
}


@end
