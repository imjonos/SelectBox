SelectBox
========

iOS 7 SelectBox view

How to use:
=============================
Delegate 

SelectBoxViewDelegate

method:

- (void) setSelectRow: (UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


in .h file:

@property SelectBoxView *selectBox;

in .m file:

NSMutableArray *arrayData = [[NSMutableArray alloc] init];
NSMutableArray *sectionArray = [[NSMutableArray alloc] init];

NSArray *titles = @[@"title 1", @"title 2", @"title 3"];
NSArray *values = @[@"value 1", @"value 2", @"value 3"];
    
[sectionArray addObject:@"Select Box Header"];
[sectionArray addObject:titles];
[sectionArray addObject:values];

    
[arrayData addObject:sectionArray];

self.selectBox = [[SelectBoxView alloc] initWithFrame:CGRectMake(0,10, self.view.frame.size.width,30) andData:arrayData andSection:0 andRow:0  andImage:@"ico.png"];
self.selectBox.parentNavigationController = self.navigationController;
self.selectBox.delegate = self;
[self.selectBox setSelectBoxTag:0];
[self.view addSubview:self.selectBox];
