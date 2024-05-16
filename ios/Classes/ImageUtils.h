//
//  ImageUtils.h
//  opencv_4
//
//  Created by Giap Tran Van on 16/05/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageUtils : NSObject

+ (void)transformImage:(CFDataRef)dataRef contextRef:(CGContextRef)contextRef width:(CGFloat)width height:(CGFloat)height;

+ (UIImageOrientation)getOrientation:(CFDataRef)dataRef;

@end

NS_ASSUME_NONNULL_END
