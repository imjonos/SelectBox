//
//  SelectBoxView.h
//  yempl
//
//  Created by NOs on 13.08.14.
//  Copyright (c) 2014 yempl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerViewController.h"
#import <QuartzCore/QuartzCore.h>

@class SelectBoxView;             //define class, so protocol can see MyClass
@protocol SelectBoxViewDelegate <NSObject>   //define delegate protocol
- (void) setSelectRow: (UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;  //define delegate method to be implemented within another class
@end

@interface SelectBoxView : UIView <PickerViewControllerDelegate>{
    PickerViewController    *_pickerController;
    NSArray                 *_pickerData;
    UIImageView             *_imageView;
    NSInteger               _pickerTag;
}

@property UIButton *selectButton;
@property (retain, nonatomic) UINavigationController *parentNavigationController;
@property (nonatomic, weak) id <SelectBoxViewDelegate > delegate;
@property BOOL isCheck;

- (void) buttonPressedAction:(id) sender;
- (id) initWithFrame:(CGRect)frame andData:(NSArray *) data andSection:(NSInteger) section andRow:(NSInteger) row;
- (id) initWithFrame:(CGRect)frame andData:(NSArray *) data andSection:(NSInteger) section andRow:(NSInteger) row  andImage:(NSString *) imageName;
- (void) setSection:(NSInteger) section andRow:(NSInteger) row andScroll:(BOOL) isScroll;
- (void) setSelectBoxTag:(NSInteger) tag;

@end
