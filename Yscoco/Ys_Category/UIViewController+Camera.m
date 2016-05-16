//
//  UIViewController+Camera.m
//  KitchenUser
//
//  Created by Rocky on 16/5/4.
//  Copyright © 2016年 Rocky. All rights reserved.
//

#import "UIViewController+Camera.h"

#import "NSString+Other.h"


@implementation UIViewController (Camera)

- (void)showSelect
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"请选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"手机相册", @"照相机", nil];
    [sheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
        if ([self isOpenPhotoLibrary]) {
            [self loadPhotoLibrary];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请前往 设置 > 隐私 > 照片 中打开相册访问权限" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
        }
    } else if (buttonIndex == 1) {
        
        if (![self isCameraAvailable]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请前往 设置 > 隐私 > 相机 中打开相机访问权限" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
        } else {
            [self loadPickerController];
        }
    }
}

// 判断设备是否有摄像头
- (BOOL)isCameraAvailable {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

// 判断是不是打开图片库
- (BOOL)isOpenPhotoLibrary {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
}

// 加载摄像头视图控制器的方法
- (void)loadPickerController {
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraUI.allowsEditing = self.view.tag == kEditTag;
    cameraUI.delegate = self;
    
    [self presentViewController:cameraUI animated:YES completion:nil];
}

// 加载图片库视图控制器的方法
- (void)loadPhotoLibrary {
    UIImagePickerController *photoLibrary = [[UIImagePickerController alloc] init];
    photoLibrary.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    photoLibrary.allowsEditing = self.view.tag == kEditTag;
    photoLibrary.delegate = self;
    
    [self presentViewController:photoLibrary animated:YES completion:nil];
}

- (NSData *)imageToData:(UIImage *)image
{
    if (!image) {
        return nil;
    }
    
    if ([self imageHasAlpha:image]) {
        return UIImagePNGRepresentation(image);
    } else {
        return UIImageJPEGRepresentation(image, 1.0f);
    }
}

- (NSString *)image2DataURL:(UIImage *)image
{
    if (!image) {
        return @"";
    }
    
    NSData *imageData = nil;
    NSString *mimeType = nil;
    
    if ([self imageHasAlpha:image]) {
        imageData = UIImagePNGRepresentation(image);
        mimeType = @"image/png";
    } else {
        imageData = UIImageJPEGRepresentation(image, 1.0f);
        mimeType = @"image/jpeg";
    }
    
    NSString *imgStr = [imageData base64EncodedStringWithOptions:0];
    
    return [imgStr URLEncodedString];
}

- (NSString *)encodeURL:(NSString *)string
{
    NSString *newString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault,
                                                                                                (CFStringRef)string,
                                                                                                NULL,
                                                                                                CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"),
                                                                                                kCFStringEncodingUTF8));
    if (newString) {
        return newString;
    }
    return @"";
}

- (BOOL)imageHasAlpha:(UIImage *)image
{
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(image.CGImage);
    return (alpha == kCGImageAlphaFirst || alpha == kCGImageAlphaLast || alpha == kCGImageAlphaPremultipliedFirst || alpha == kCGImageAlphaPremultipliedLast);
}


@end
