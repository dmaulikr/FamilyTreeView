# HeritageView

HeritageView is an Objective-C class that builds and displays a heritage tree.
<p align="center" >
<img src="https://raw.githubusercontent.com/chenyun122/HeritageView/master/Screenshot.PNG" alt="HeritageView" title="HeritageView">
</p>

## Installation
###  CocoaPods
Coming soon
###  Source files
1.You could directly copy and add the folder `HeritageView` to your project.   
2.Include HeritageView wherever you need it with `#import "HeritageView.h"`

## Usage
### Major steps
```objective-c
    HeritageView *heritageView = [[HeritageView alloc] initWithFrame:self.view.bounds];
    heritageView.delegate = self;   //set self as the delegate if it needs to receive click event
    [self.view addSubview:heritageView];

    HeritageModel *model = [[HeritageModel alloc] init];
    model.name = @"Laurence Chavis";
    //......
    heritageView.model = model;     //the heritage tree will be built after setting model

    //The more intelligent way should be adopted to convert JSON to Model instead of creating models manually.
    //In demo project, class ExampleData/ExampleDataParser.m provides an example for using YYModel to convert JSON data.
```

### Working with Xib or Storyboard(Optional)
It's very easy to do that. Just add a UIView into XIB or Storyboard, and set the view class to `HeritageView`. And then bind it to a property in source code like:   
`@property(nonatomic,weak) IBOutlet HeritageView *heritageView;`

### Preparing data
The class `HeritageModel` defines person's information, and relations between the person and his/her mates and children. A low efficient but clear demonstration for building Laurence Chavis's family heritage tree:
```objective-c
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
    son.name = @"Larry Chavis";
    son.gender = male;
    son.birthday = @"5/22/1952";
    
    mother.children = @[son];
    father.mates = @[mother];
    
    self.heritageView.model = father;
```
An **efficient** way to parse JSON to HeritageModel is provide in Demo project: [Link]

### Customization
A few public properties are provided to customize the person's view:
```objective-c
    self.heritageView.textColor = UIColor.whiteColor;
    self.heritageView.personViewBackgroundColor = UIColor.redColor;
    self.heritageView.femaleBorderColor = UIColor.yellowColor;
    self.heritageView.maleBorderColor = UIColor.greenColor;
```
Feel free to modify the source code to make it suitale for you. Alternatively, submit an issue to let me know what customization you need.

### Handling event
The delegate implement follow method to handle event:
```objective-c
#pragma mark - Heritage View Delegate
- (void)personDidClick:(HeritageModel *)model {
    NSLog(@"Person %@ did click",model.name);
}
```

## License
HeritageView is released under the MIT license. See LICENSE for details.

