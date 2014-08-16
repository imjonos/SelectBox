//
//  SelectBoxView.m
//  yempl
//
//  Created by NOs on 13.08.14.
//  Copyright (c) 2014 yempl. All rights reserved.
//

#import "SelectBoxView.h"

@implementation SelectBoxView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       // [self setBackgroundColor:[UIColor lightGrayColor]];

        self.selectButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0, self.frame.size.width, self.frame.size.height)];
        [self.selectButton addTarget:self action:@selector(buttonPressedAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.selectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.selectButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.selectButton.layer setBorderColor: [[UIColor lightTextColor] CGColor]];
        [self addSubview:self.selectButton];
        
        UIView *bottomBorder = [[UIView alloc] initWithFrame:CGRectMake(15, self.selectButton.frame.size.height - 1.0f, self.selectButton.frame.size.width, 1)];
        bottomBorder.backgroundColor = [UIColor lightGrayColor];
        
        [self.selectButton addSubview:bottomBorder];
        
      
           }
    return self;
}

- (void) setSection:(NSInteger) section andRow:(NSInteger) row andScroll:(BOOL) isScroll{
    _pickerController.selectedRow = row;
    _pickerController.selectedSection = section;
    
    NSArray *sectionArray = [_pickerData objectAtIndex:section];
    NSArray *sectionDataArray = [sectionArray objectAtIndex:1];
    NSString *titleBox = [sectionDataArray objectAtIndex:row];
    [self.selectButton setTitle:titleBox forState:UIControlStateNormal];
    
    [_pickerController refreshDataWithScroll:isScroll];
}


- (id) initWithFrame:(CGRect)frame andData:(NSArray *) data  andSection:(NSInteger) section andRow:(NSInteger) row{
    _pickerData = data;
    self.isCheck = YES;
    self = [self initWithFrame:frame];
    _pickerController = [[PickerViewController alloc] initWithData:_pickerData andFrame:[UIScreen mainScreen].bounds];
    _pickerController.delegate = self;
    _pickerController.isCheck = self.isCheck;
    [self setSection:section andRow:row andScroll:YES];
    return  self;
}

- (id) initWithFrame:(CGRect)frame andData:(NSArray *) data andSection:(NSInteger)section andRow:(NSInteger)row  andImage:(NSString *) imageName{
   self = [self initWithFrame:frame andData:data  andSection:section andRow:row];
   UIImage *imageIco = [UIImage imageNamed: imageName];
    _imageView = [[UIImageView alloc] initWithImage:imageIco];
    _imageView.frame = CGRectMake(10, 5, 20, 20);
    [self addSubview:_imageView];
    NSLog(@"%@",imageName);
   return self;
}

- (void) setSelectBoxTag:(NSInteger) tag{
    [_pickerController setPickerTag:tag];
}


- (void) buttonPressedAction:(id) sender{
    NSLog(@"press ok");
    _pickerController.isCheck = self.isCheck;
    [self setSection:_pickerController.selectedSection andRow:_pickerController.selectedRow andScroll:YES];
    [UIView  beginAnimations: @"Showinfo"context: nil];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.75];
    [self.parentNavigationController pushViewController:_pickerController animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.parentNavigationController.view cache:NO];
    [UIView commitAnimations];
}


- (void) selectRow: (UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate setSelectRow:aTableView didSelectRowAtIndexPath:indexPath];
    [self setSection:indexPath.section andRow:indexPath.row andScroll:NO];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
