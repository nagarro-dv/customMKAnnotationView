//
//  MKAnnotationView+WebCache.h
//  postcards
//
//  Created by Mohith K M on 9/2/11.
//  Copyright 2011 Mokriya. All rights reserved.
//

#import "SDWebImageCompat.h"
#import "SDWebImageManagerDelegate.h"
#import "MapKit/MapKit.h"

@interface MKAnnotationView (WebCache) <SDWebImageManagerDelegate>

- (void)setImageWithURL:(NSURL *)url;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
- (void)cancelCurrentImageLoad;
- (UIImage *)getCompositeImageWithBottomImage:(UIImage *)bottomImage andWithTopImage:(UIImage *)topImage;

@end

