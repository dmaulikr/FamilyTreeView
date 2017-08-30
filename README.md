# FamilyTreeView

FamilyTreeView is an Objective-C class that builds and displays a family tree.
<p align="center" >
<img src="https://raw.githubusercontent.com/chenyun122/FamilyTreeView/master/Screenshot170830.PNG" alt="FamilyTreeView" title="FamilyTreeView">
</p>

## Installation
###  CocoaPods
Coming soon
###  Source files
1.You could directly copy and add the folder `FamilyTreeView` to your project.   
2.Include FamilyTreeView wherever you need it with `#import "FamilyTreeView.h"`

## Usage
### Major process
```objective-c
    FamilyTreeView *familyTreeView = [[FamilyTreeView alloc] initWithFrame:self.view.bounds];
    familyTreeView.delegate = self;   //set self as the delegate if it needs to receive click event
    [self.view addSubview:familyTreeView];

    PersonModel *model = [[PersonModel alloc] init];
    model.name = @"Laurence Chavis";
    //......
    familyTreeView.model = model;     //the family tree will be built after setting model

    //The more intelligent way should be adopted to convert JSON to Model instead of creating models manually.
    //In demo project, class ExampleData/ExampleDataParser.m provides an example for using YYModel to convert JSON data.
```

### Working with Xib or Storyboard(Optional)
It's very easy to do that. Just add a UIView into XIB or Storyboard, and set the view class to `FamilyTreeView`. And then bind it to a property in source code like:   
`@property(nonatomic,weak) IBOutlet FamilyTreeView *familyTreeView;`

### Preparing data
The class `PersonModel` defines person's information, and relations between the person and his/her mates and children. A low efficient but clear demonstration for building Laurence Chavis's family tree:
```objective-c
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
    son.name = @"Larry Chavis";
    son.gender = male;
    son.birthday = @"5/22/1952";
    
    mother.children = @[son];
    father.mates = @[mother];
    
    familyTreeView.model = father;
```
An **efficient** way to parse JSON to PersonModel is provide in Demo project:   
[Example data parsing](https://github.com/chenyun122/FamilyTreeView/tree/master/FamilyTreeViewDemo/ExampleData) 

### Customization
A few public properties are provided to customize the person's view:
```objective-c
    self.familyTreeView.textColor = UIColor.whiteColor;
    self.familyTreeView.personViewBackgroundColor = UIColor.redColor;
    self.familyTreeView.femaleBorderColor = UIColor.yellowColor;
    self.familyTreeView.maleBorderColor = UIColor.greenColor;
```
Feel free to modify the source code to make it suitable for you. Alternatively, submit an issue to let me know what customization you need.

### Handling event
The delegate implements follow method to handle event:
```objective-c
#pragma mark - FamilyTree View Delegate
- (void)personDidClick:(PersonModel *)model {
    NSLog(@"Person %@ did click",model.name);
}
```

## License
FamilyTreeView is released under the MIT license. See LICENSE for details.

