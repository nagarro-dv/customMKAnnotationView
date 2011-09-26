//
//  MKAnnotationView+WebCache.h
//  customMapAnnotation
//
//  Created by Mohith K M on 9/26/11.
//  Copyright 2011 Mokriya  (www.mokriya.com). All rights reserved.
//

#import "SDWebImageCompat.h"
#import "SDWebImageManagerDelegate.h"
#import "MapKit/MapKit.h"

@interface MKAnnotationView (WebCache) <SDWebImageManagerDelegate>

- (void)setImageWithURL:(NSURL *)url;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
- (void)cancelCurrentImageLoad;

@end

