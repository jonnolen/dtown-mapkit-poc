//
//  DTViewController.m
//  testMapKit
//
//  Created by Jonathan Nolen on 11/5/12.
//  Copyright (c) 2012 Developertown. All rights reserved.
//

#import "DTViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>

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

-(IBAction)mapItTheHardWay:(id)sender{
    CLGeocoder *geocoder = [CLGeocoder new];
    
    [geocoder geocodeAddressString:@"5255 Winthrop Ave, Indianapolis, IN 46220"
                 completionHandler:^(NSArray *placemarks, NSError *err){
                     if (err){
                         NSLog(@"BIFFED");
                     }
                     else{
                         if (placemarks && placemarks.count > 0){
                             CLPlacemark *mark = placemarks[0];

                             [self throwUpAMapHard:mark.location.coordinate];
                         }
                     }
                 }];
}

-(void)throwUpAMap:(CLPlacemark *)placemark{
    MKPlacemark *place = [[MKPlacemark alloc] initWithPlacemark:placemark];
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:place];
    
    [mapItem openInMapsWithLaunchOptions:nil];
}
-(void)throwUpAMapHard:(CLLocationCoordinate2D)coords{
    
    NSDictionary *address = @{
        (NSString *)kABPersonAddressStreetKey: @"5255 Winthrop Ave",
        (NSString *)kABPersonAddressCityKey: @"Indianapolis",
        (NSString *)kABPersonAddressStateKey: @"IN",
        (NSString *)kABPersonAddressZIPKey: @"46220"
    };
    
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coords addressDictionary:address];
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    
    [mapItem openInMapsWithLaunchOptions:nil];
}
@end
