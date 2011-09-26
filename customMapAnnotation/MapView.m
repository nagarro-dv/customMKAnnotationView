//
//  MapView.m
//  customMapAnnotation
//
//  Created by Mohith K M on 9/26/11.
//  Copyright 2011 Mokriya (www.mokriya.com). All rights reserved.
//

#import "MapView.h"
#import "MKAnnotationView+WebCache.h"

@implementation MapView
@synthesize mapview;
@synthesize mapAnnotations;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [mapview release];
    [mapAnnotations release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    double lat = 40.33168900;
    double lng = -110.03073100;
    
	    
    mapAnnotations = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 20; i++) 
    {    
        
        
        CustomAnnotation *annotation = [[CustomAnnotation alloc] initWithLatitude:lat longitude:lng];
        annotation.tag = i;
        [self.mapAnnotations addObject:annotation];
        [annotation release];
        lat += 0.5;
        lng += 0.5;
    }
    [self.mapview addAnnotations:self.mapAnnotations];
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = 50.000000;
    newRegion.center.longitude = -100.00000;
    
    newRegion.span.latitudeDelta = 5.000;
    newRegion.span.longitudeDelta = 5.000;
    
    [self.mapview setRegion:newRegion animated:YES];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    CustomAnnotation *anno = (CustomAnnotation *)annotation;
    
    static NSString *defaultPinID = @"customIdentifier";
    
    MKAnnotationView *pinView = (MKAnnotationView *)[self.mapview dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
    
    if (pinView == nil)
        pinView = [[[MKAnnotationView alloc] initWithAnnotation:anno reuseIdentifier:defaultPinID] autorelease];
    pinView.opaque = NO;
    pinView.canShowCallout = NO; 
    pinView.draggable = NO;
    pinView.annotation = anno;
    
    NSURL *ImageURL = [NSURL URLWithString:IMAGE_URL_STRING];
    [pinView setImageWithURL:ImageURL placeholderImage:[UIImage imageNamed:@"loading.png"]];
    
    
    return pinView;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
