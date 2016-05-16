//
//  UIViewController+Camera.h
//  KitchenUser
//
//  Created by Rocky on 16/5/4.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kEditTag 999
#define kNotEditTag 998

@interface UIViewController (Camera) <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate>

- (void)showSelect;

- (NSData *)imageToData:(UIImage *)image;


@end
