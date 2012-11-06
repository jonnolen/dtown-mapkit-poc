//
//  DTViewController.m
//  testMapKit
//
//  Created by Jonathan Nolen on 11/5/12.
//  Copyright (c) 2012 Developertown. All rights reserved.
//

#import "DTViewController.h"
#import <MapKit/MapKit.h>

@interface DTViewController ()

@end

@implementation DTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)mapIt:(id)sender{
    CLGeocoder *geocoder = [CLGeocoder new];
    
    [geocoder geocodeAddressString:@"5255 Winthrop Ave, Indianapolis, IN 46220"
                 completionHandler:^(NSArray *placemarks, NSError *err){
                     if (err){
                         NSLog(@"BIFFED");
                     }
                     else{
                         if (placemarks && placemarks.count > 0){
                             [self throwUpAMap:placemarks[0]];
                         }
                     }
                 }];
}

-(void)throwUpAMap:(CLPlacemark *)placemark{
    MKPlacemark *place = [[MKPlacemark alloc] initWithPlacemark:placemark];
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:place];
    
    [mapItem openInMapsWithLaunchOptions:nil];
}
@end
