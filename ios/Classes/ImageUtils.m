//
//  ImageUtils.m
//  opencv_4
//
//  Created by Giap Tran Van on 16/05/2024.
//

#import "ImageUtils.h"

@implementation ImageUtils

+ (UIImageOrientation)getOrientation:(CFDataRef)dataRef
{
  CGImageSourceRef sourceRef = CGImageSourceCreateWithData(dataRef, NULL);
  NSDictionary *properties = CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(sourceRef, 0, NULL));
  UIImageOrientation imageOrientation = (UIImageOrientation) [[properties valueForKey:@"Orientation"] intValue];

  switch (imageOrientation) {
    case UIImageOrientationLeft:
      return UIImageOrientationUp;

    case UIImageOrientationLeftMirrored:
      return UIImageOrientationRight;
      
    case UIImageOrientationRight:
      return UIImageOrientationDown;
      
    case UIImageOrientationRightMirrored:
      return UIImageOrientationLeft;
      
    case UIImageOrientationDownMirrored:
    case UIImageOrientationDown:
      return UIImageOrientationUp;
      
    case UIImageOrientationUpMirrored:
    case UIImageOrientationUp:
      return UIImageOrientationDown;
      
    default:
      return UIImageOrientationLeft;
  }
}

@end
