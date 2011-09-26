//
//  MapView.h
//  customMapAnnotation
//
//  Created by Mohith K M on 9/26/11.
//  Copyright 2011 Mokriya (www.mokriya.com). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import "CustomAnnotation.h"
#define IMAGE_URL_STRING @"http://www.mokriya.com/images/m6.png"

@interface MapView : UIViewController <MKMapViewDelegate>{    
}
@property (nonatomic,retain) IBOutlet MKMapView *mapview;
@property (nonatomic,retain)NSMutableArray *mapAnnotations;

@end
