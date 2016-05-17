//
//  RActionSheet.h
//  Yscoco
//
//  Created by Rocky on 16/5/16.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RActionSheet;

typedef enum {
    RActionSheetStyleDefault, // 正常字体样式
    RActionSheetStyleCancel,  // 粗体字样式
    RActionSheetStyleDestructive // 红色字体样式
} RActionSheetStyle;

@protocol RActionSheetDelegate <NSObject>
/**
 *  代理方法
 *
 *  @param actionSheet actionSheet
 *  @param index       被点击按钮是哪个
 */
- (void)clickAction:(RActionSheet *)actionSheet atIndex:(NSUInteger)index;
@end

@interface RActionSheet : UIView
/**
 *  设置代理
 */
@property (nonatomic, weak) id<RActionSheetDelegate> delegate;

@property (strong, nonatomic) void(^clickAtIndex)(NSUInteger);

/**
 *  初始化方法
 *
 *  @param title    提示内容
 *  @param confirms 选项标题数组
 *  @param cancel   取消按钮标题
 *  @param style    显示样式
 *
 *  @return         actionSheet
 */
+ (RActionSheet *)actionSheetWithTitle:(NSString *)title confirms:(NSArray *)confirms cancel:(NSString *)cancel style:(RActionSheetStyle)style;
/**
 *  显示方法
 *
 *  @param obj UIView或者UIWindow类型
 */
- (void)showInView:(id)obj;



@end
