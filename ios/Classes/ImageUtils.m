//
//  ImageUtils.m
//  opencv_4
//
//  Created by Giap Tran Van on 16/05/2024.
//

#import "ImageUtils.h"

@implementation ImageUtils

+ (void)transformImage:(CFDataRef)dataRef contextRef:(CGContextRef)contextRef width:(CGFloat)width height:(CGFloat)height
{
  CGImageSourceRef sourceRef = CGImageSourceCreateWithData(dataRef, NULL);
  NSDictionary *properties = CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(sourceRef, 0, NULL));
  UIImageOrientation imageOrientation = (UIImageOrientation) [[properties valueForKey:@"Orientation"] intValue];

  CGAffineTransform transform = CGAffineTransformIdentity;

  switch (imageOrientation) {
    case UIImageOrientationLeftMirrored:
      transform = CGAffineTransformRotate(transform, M_PI_2);
      break;
      
    case UIImageOrientationRightMirrored:
      transform = CGAffineTransformRotate(transform, -M_PI_2);
      break;
    default:
      return;
  }
  
  CGContextConcatCTM(contextRef, transform);
}

+ (UIImageOrientation)getOrientation:(CFDataRef)dataRef
{
  CGImageSourceRef sourceRef = CGImageSourceCreateWithData(dataRef, NULL);
  NSDictionary *properties = CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(sourceRef, 0, NULL));
  UIImageOrientation imageOrientation = (UIImageOrientation) [[properties valueForKey:@"Orientation"] intValue];

  switch (imageOrientation) {
    case UIImageOrientationLeftMirrored:
      return UIImageOrientationRight;
      
    case UIImageOrientationRightMirrored:
      return UIImageOrientationLeft;
    default:
      return imageOrientation;
  }
}

@end
