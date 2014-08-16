//
//  PickerViewController.m
//  yempl
//
//  Created by NOs on 13.08.14.
//  Copyright (c) 2014 yempl. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@end

@implementation PickerViewController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithData:(NSArray *) data  andFrame:(CGRect ) frameSize
{
    self = [super init];
    if (self) {
        _pickerData = data;
        self.view.frame = frameSize;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    
    [self.view addSubview:_tableView];
    
    
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (void) refreshDataWithScroll:(BOOL) scroll{
    [_tableView reloadData];
    
    if(scroll == YES) [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.selectedRow inSection:self.selectedSection] atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
}

- (void) setPickerTag:(NSInteger) tag{

    _tableView.tag = tag;
}


- (void) selectedRow:(NSInteger)selectedRow{

    self.selectedRow = selectedRow;
    [_tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_pickerData count];    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sectionArray = [_pickerData objectAtIndex:section];
    NSArray *sectionDataArray = [sectionArray objectAtIndex:1];
        return [sectionDataArray count];    //count number of row from counting array hear cataGorry is An Array
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    NSString *title = [self tableView:tableView titleForHeaderInSection:section];
    if([title length]>0 ){
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.frame = CGRectMake(0, 0, 320, 30);
    myLabel.font = [UIFont boldSystemFontOfSize:18];
    myLabel.text = [NSString stringWithFormat:@"   %@", title];
    
    myLabel.backgroundColor = [UIColor colorWithRed:243.0f/255.0f green:243.0f/255.0f blue:243.0f/255.0f alpha:1.0f];
    [headerView addSubview:myLabel];
    }
    return headerView;
}




- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *sectionArray = [_pickerData objectAtIndex:section];
    NSString *sectionName = [sectionArray objectAtIndex:0];
    return sectionName;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *MyIdentifier = [NSString stringWithFormat:@"ListCell_%ld",(long)indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    //if(cell == nil)
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    NSArray *sectionArray = [_pickerData objectAtIndex:indexPath.section];
    
    NSArray *sectionRowArray = [sectionArray objectAtIndex:1];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.text = [sectionRowArray objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = [UIColor colorWithRed:33.0f/255.0f green:117.0f/255.0f blue:155.0f/255.0f alpha:1.0f];
    if(indexPath.section == self.selectedSection && indexPath.row == self.selectedRow && self.isCheck) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    
    return cell;
}


- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"idSelectRowAtIndexPath");
    [self.delegate selectRow:aTableView didSelectRowAtIndexPath:indexPath];
    
}



@end
