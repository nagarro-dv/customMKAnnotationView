/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
#import "SDImageCache.h"

@implementation UIImageView (WebCache)

- (void)setImageWithURL:(NSURL *)url
{
    [self setImageWithURL:url placeholderImage:nil];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];

    // Remove in progress downloader from queue
    [manager cancelForDelegate:self];

    if (url)
    {
        UIImage *cachedImage = [[SDImageCache sharedImageCache] imageFromKey:[url absoluteString]];
        if(cachedImage == nil)
        {
            self.image = placeholder;
            [manager downloadWithURL:url delegate:self];
        }
        else
            self.image = cachedImage;
    }
}

- (void)cancelCurrentImageLoad
{
    [[SDWebImageManager sharedManager] cancelForDelegate:self];
}

- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image
{
    self.alpha = 0.0;
    self.image = image;
    [UIView animateWithDuration:0.25 delay:0.0 options:(UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction) animations:^{self.alpha = 1.0;} completion:nil];
}

@end
