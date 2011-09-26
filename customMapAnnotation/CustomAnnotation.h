//
//  CustomAnnotation.h
//  customMapAnnotation
//
//  Created by Mohith K M on 9/26/11.
//  Copyright 2011 Mokriya  (www.mokriya.com). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"

@interface CustomAnnotation : NSObject <MKAnnotation> {
    UIImage *image;
    float latitude;
    float longitude;
    int tag;
}

@property (nonatomic, retain) UIImage *image;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;
@property (nonatomic) int tag;

- (id) initWithLatitude:(CLLocationDegrees) lat longitude:(CLLocationDegrees) lng;

@end
