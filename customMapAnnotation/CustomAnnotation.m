//
//  CustomAnnotation.m
//  customMapAnnotation
//
//  Created by Mohith K M on 9/26/11.
//  Copyright 2011 Mokriya  (www.mokriya.com). All rights reserved.
//

#import "CustomAnnotation.h"


@implementation CustomAnnotation
@synthesize image;
@synthesize latitude;
@synthesize longitude;
@synthesize tag;

- (id) initWithLatitude:(CLLocationDegrees) lat longitude:(CLLocationDegrees) lng 
{
    latitude = lat;
    longitude = lng;
    return self;
}
- (CLLocationCoordinate2D) coordinate {
    CLLocationCoordinate2D coord = {self.latitude, self.longitude};
    return coord;
}

-(void) dealloc
{
	[image release];
	[super dealloc];
}

@end
