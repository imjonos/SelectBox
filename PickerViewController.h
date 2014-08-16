//
//  PickerViewController.h
//  yempl
//
//  Created by NOs on 13.08.14.
//  Copyright (c) 2014 yempl. All rights reserved.
//


@class PickerViewController;             //define class, so protocol can see MyClass
@protocol PickerViewControllerDelegate <NSObject>   //define delegate protocol
- (void) selectRow: (UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;  //define delegate method to be implemented within another class
@end


#import <UIKit/UIKit.h>

@interface PickerViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
   
    UITableView     *_tableView;
    NSArray         *_pickerData;
}
@property NSInteger selectedRow;
@property NSInteger selectedSection;
@property (nonatomic, weak) id <PickerViewControllerDelegate > delegate;
@property BOOL isCheck;

- (void) selectedRow:(NSInteger)selectedRow;
- (id) initWithData:(NSArray *) data andFrame:(CGRect ) frameSize;
- (void) refreshDataWithScroll:(BOOL) scroll;
- (void) setPickerTag:(NSInteger) tag;
@end
