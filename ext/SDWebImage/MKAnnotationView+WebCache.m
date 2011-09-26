//
//  MKAnnotationView+WebCache.m
//  postcards
//
//  Created by Mohith K M on 9/2/11.
//  Copyright 2011 Mokriya. All rights reserved.
//

#import "MKAnnotationView+WebCache.h"
#import "SDWebImageManager.h"
#import "SDImageCache.h"


@implementation MKAnnotationView(WebCache)


- (void)setImageWithURL:(NSURL *)url
{
    [self setImageWithURL:url placeholderImage:nil];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    // Remove in progress downloader from queue
    [manager cancelForDelegate:self];
    [self setImage:placeholder];
    //[self setImage:placeholder forState:UIControlStateNormal];
    
    if (url)
    {
        [manager downloadWithURL:url delegate:self];
    }
}

- (void)cancelCurrentImageLoad
{
    [[SDWebImageManager sharedManager] cancelForDelegate:self];
}

- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image
{
    [self setImage:[self getCompositeImageWithBottomImage:nil andWithTopImage:image]];
}

- (UIImage *)getCompositeImageWithBottomImage:(UIImage *)bottomImage andWithTopImage:(UIImage *)topImage
{
    
    
    if (self.selected) {
        bottomImage = [UIImage imageNamed:@"authorprofilepicbackgroundonmap_selected.png"];
    } else {
        bottomImage = [UIImage imageNamed:@"authorprofilepicbackgroundonmap.png"];
    }
    CGSize newSize = bottomImage.size;//CGSizeMake(width, height);
    UIGraphicsBeginImageContext( newSize );
    [bottomImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    [topImage drawInRect:CGRectMake(4,4,35,35) blendMode:kCGBlendModeNormal alpha:1];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
