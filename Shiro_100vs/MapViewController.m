//
//  MapViewController.m
//  Shiro100
//
//  Created by 寺内 信夫 on 2014/11/02.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import "MapViewController.h"

#import "AppDelegate.h"
#import "CameraViewController.h"
#import "InstagramKit.h"

@interface MapViewController ()
{
	
@private
	
	AppDelegate *app;	
	
	CLLocationManager *locationManager;
	
	CLLocationCoordinate2D coordinate;
	
	CLLocationDegrees   latitude, longitude;
	CLLocationDirection heading;

}

@end

@implementation MapViewController

- (void)viewDidLoad
{
	
	[super viewDidLoad];
	
	app = [[UIApplication sharedApplication] delegate];
	
	[self initMapView];
	
	[self initLocationManager];
	
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta = 0.005;
	span.longitudeDelta = 0.005;
	
	CLLocation *loc = [locationManager location];
	
	CLLocationCoordinate2D location;
	location.latitude  = [loc coordinate].latitude;// 34.07511029;
	location.longitude = [loc coordinate].longitude;// 134.556;//55709219;
	
	region.span   = span;
	region.center = location;
	
	
//	CustomAnnotation_GPS *ca = [[CustomAnnotation_GPS alloc] init];
//	
//	ca.coordinate  = location;
//	ca.title       = @"自分の現在位置";
//	ca.subtitle    = [NSString stringWithFormat: @"%f, %f", latitude, longitude];
//	ca.explanation = @"";
//	
//	[app.array_GPS addObject: ca];
//	
//	
//	[self addAnnotation_Hata];
	
	[self.mapView setRegion: region
				   animated: YES];
	
//	timer_Hata = [NSTimer scheduledTimerWithTimeInterval: 0.1
//												  target: self
//												selector: @selector( timer_Action: )
//												userInfo: nil
//												 repeats: YES];
	
}

- (void)viewWillAppear:(BOOL)animated
{
	
	//	[self addAnnotation_Photo_Add];
//	[self addAnnotation_Photo];
//	[self setAnnotation_GPS];
//	[self setAnnotation_GPSOld];
	
}

- (void)viewDidAppear:(BOOL)animated
{
	
}

- (void)viewWillDisappear:(BOOL)animated
{
	
}

- (void)viewDidDisappear:(BOOL)animated
{
	
}

- (void)didReceiveMemoryWarning
{
	
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
	
}

// 地図初期化
- (void)initMapView
{
	
	self.mapView.delegate = self;
	
	self.mapView.showsUserLocation = YES;
//	self.mapView.mapType = MKMapTypeHybrid;
	
}

// GPS初期化
- (void)initLocationManager
{
	
	locationManager = [[CLLocationManager alloc] init];
	
	[locationManager requestAlwaysAuthorization];
	
	locationManager.delegate = self;
	
	locationManager.distanceFilter  = kCLDistanceFilterNone;
	locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	
	if ( [CLLocationManager locationServicesEnabled] ) {
		
		[locationManager startUpdatingLocation];
		
	}
	
	if ( [CLLocationManager headingAvailable] ) {
		
		[locationManager startUpdatingHeading];
		
	}
	
}

// 地図関連
- (void)mapViewWillStartLoadingMap: (MKMapView *)mapView
{
	
	//	MKCoordinateRegion region = mapView.region;
	//
	//	CLLocationCoordinate2D coord = region.center;
	//	MKCoordinateSpan span = region.span;
	
	//	NSLog( @"1 coord = (%f,%f) span = (%f,%f)", coord.latitude, coord.longitude, span.latitudeDelta, span.longitudeDelta );
	//
	//	self.label_1.text = [NSString stringWithFormat: @"coord = (%f,%f)", coord.latitude    , coord.longitude];
	//	self.label_2.text = [NSString stringWithFormat: @"span  = (%f,%f)", span.latitudeDelta, span.longitudeDelta];
	
}

- (void)mapViewDidFinishLoadingMap: (MKMapView *)mapView
{
	
}

- (void)        mapView: (MKMapView *)mapView
didSelectAnnotationView: (MKAnnotationView *)view
{
	
	//	MKCoordinateRegion region = mapView.region;
	//
	//	CLLocationCoordinate2D coord = region.center;
	//	MKCoordinateSpan span = region.span;
	
	//	NSLog( @"2 coord = (%f,%f) span = (%f,%f)", coord.latitude, coord.longitude, span.latitudeDelta, span.longitudeDelta );
	//
	//	self.label_1.text = [NSString stringWithFormat: @"coord = (%f,%f)", coord.latitude    , coord.longitude];
	//	self.label_2.text = [NSString stringWithFormat: @"span  = (%f,%f)", span.latitudeDelta, span.longitudeDelta];
	
}

- (MKOverlayRenderer *)mapView: (MKMapView *)mapView
			rendererForOverlay: (id<MKOverlay>)overlay
{
	
	return nil;
	
}

- (void)       mapView: (MKMapView *)mapView
didAddOverlayRenderers: (NSArray *)renderers
{
	
	//	MKCoordinateRegion region = mapView.region;
	//
	//	CLLocationCoordinate2D coord = region.center;
	//	MKCoordinateSpan span = region.span;
	
	//	NSLog( @"3 coord = (%f,%f) span = (%f,%f)", coord.latitude, coord.longitude, span.latitudeDelta, span.longitudeDelta );
	//
	//	self.label_1.text = [NSString stringWithFormat: @"coord = (%f,%f)", coord.latitude    , coord.longitude];
	//	self.label_2.text = [NSString stringWithFormat: @"span  = (%f,%f)", span.latitudeDelta, span.longitudeDelta];
	
}

- (void)      mapView: (MKMapView *)mapView
didAddAnnotationViews: (NSArray *)views
{
	
	// add detail disclosure button to callout
	//	[views enumerateObjectsUsingBlock: ^( id obj, NSUInteger idx, BOOL* stop ) {
	//
	//		//((MKAnnotationView*)obj).rightCalloutAccessoryView = [UIButton buttonWithType: UIButtonTypeDetailDisclosure];
	//
	//	}];
	
}

-(void)               mapView: (MKMapView *)mapView
			   annotationView: (MKAnnotationView *)view
calloutAccessoryControlTapped: (UIControl *)control
{
	
//	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//	
//	CustomAnnotation *ca = [view annotation];
//	
//	if ( [[ca class] isSubclassOfClass: [CustomAnnotation_Hata class]] ) {
//		
//		[ud setObject: ca.no forKey: @"Hata Data No"];
//		
//		[self performSegueWithIdentifier: @"segue hata"
//								  sender: self];
//		
//		//		self.hataView.hidden = NO;
//		
//	} else if ( [[ca class] isSubclassOfClass: [CustomAnnotation_Photo class]] ) {
//		
//		[ud setObject: ca.no forKey: @"Photo Data No"];
//		
//		[self performSegueWithIdentifier: @"segue hata"
//								  sender: self];
//		
//	} else if ( [[ca class] isSubclassOfClass: [CustomAnnotation_GPS class]] ) {
//		
//	} else if ( [[ca class] isSubclassOfClass: [CustomAnnotation_GPS_Old class]] ) {
//		
//	}
	
}

- (void)          mapView: (MKMapView *)mapView
didDeselectAnnotationView: (MKAnnotationView *)view
{
	
	//	view.rightCalloutAccessoryView = [UIButton buttonWithType: UIButtonTypeDetailDisclosure];
	
	
}

- (MKAnnotationView *)mapView: (MKMapView*)mapView
			viewForAnnotation: (id)annotation
{
	
//	if ( [annotation isKindOfClass: [CustomAnnotation_Hata class]] ) {
//		
//		CustomAnnotation_Hata *ca1 = (CustomAnnotation_Hata *)annotation;
//		
//		MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier: @"CustomAnnotation_Hata"];
//		
//		if ( annotationView == nil ) {
//			
//			annotationView = ca1.annotationView;
//			
//		} else {
//			
//			annotationView.annotation = annotation;
//			
//		}
//		
//		return annotationView;
//		
//	} else if ( [annotation isKindOfClass: [CustomAnnotation_HataOk class]] ) {
//		
//		CustomAnnotation_HataOk *ca1 = (CustomAnnotation_HataOk *)annotation;
//		
//		MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier: @"CustomAnnotation_HataOk"];
//		
//		if ( annotationView == nil ) {
//			
//			annotationView = ca1.annotationView;
//			
//		} else {
//			
//			annotationView.annotation = annotation;
//			
//		}
//		
//		return annotationView;
//		
//	} else if ( [annotation isKindOfClass: [CustomAnnotation_Photo class]] ) {
//		
//		CustomAnnotation_Photo *ca2 = (CustomAnnotation_Photo *)annotation;
//		
//		MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier: @"CustomAnnotation_Photo"];
//		
//		if ( annotationView == nil ) {
//			
//			annotationView = ca2.annotationView;
//			
//		} else {
//			
//			annotationView.annotation = annotation;
//			
//		}
//		
//		return annotationView;
//		
//	} else if ( [annotation isKindOfClass: [CustomAnnotation_GPS class]] ) {
//		
//		CustomAnnotation_GPS *ca3 = (CustomAnnotation_GPS *)annotation;
//		
//		MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier: @"CustomAnnotation_GPS"];
//		
//		if ( annotationView == nil ) {
//			
//			annotationView = ca3.annotationView;
//			
//		} else {
//			
//			annotationView.annotation = annotation;
//			
//		}
//		
//		return annotationView;
//		
//	} else if ( [annotation isKindOfClass: [CustomAnnotation_GPS_Old class]] ) {
//		
//		CustomAnnotation_GPS_Old *ca4 = (CustomAnnotation_GPS_Old *)annotation;
//		
//		MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier: @"CustomAnnotation_GPS_Old"];
//		
//		if ( annotationView == nil ) {
//			
//			annotationView = ca4.annotationView;
//			
//		} else {
//			
//			annotationView.annotation = annotation;
//			
//		}
//		
//		return annotationView;
//		
//	} else {
	
		return nil;
		
//	}
	
}

// GPS関連
- (void)     locationManager: (CLLocationManager *)manager
didChangeAuthorizationStatus: (CLAuthorizationStatus)status
{
	
	if ( status == kCLAuthorizationStatusNotDetermined ) {
		// ユーザが位置情報の使用を許可していない
	}
	
}

- (void)locationManager: (CLLocationManager *)manager
	 didUpdateLocations: (NSArray *)locations
{
	
	CLLocation* location = [locations lastObject];
	
	CLLocationDegrees lat = location.coordinate.latitude;
	CLLocationDegrees lon = location.coordinate.longitude;
	
//	if ( latitude_Old == 9999 && longitude_Old == 9999 ) {
//		
//		latitude  = latitude_Old  = lat;
//		longitude = longitude_Old = lon;
//		
//		[self setAnnotation_GPS];
//		
//	} else {
//		
//		CLLocationDegrees _lat = lat - latitude_Old;
//		CLLocationDegrees _lon = lon - longitude_Old;
//		
//		if ( _lat < 0 ) _lat *= -1;
//		if ( _lon < 0 ) _lon *= -1;
//		
//		// 0.00007, 0.0001
//		if ( _lat > 0.0001 || _lon > 0.0001 ) {
//			
//			CustomAnnotation_GPS *gps = [self annotation_GPS];
//			
//			if ( app.bool_GPS_Old ) {
//				
//				[self addAnnotation_GPSOld];
//				
//				CustomAnnotation_GPS_Old *gps_old = [self lastAnnotation_GPSOld];
//				
//				gps_old.coordinate = gps.coordinate;
//				
//			}
//			
//			latitude  = latitude_Old  = lat;
//			longitude = longitude_Old = lon;
//			
//			gps.coordinate = CLLocationCoordinate2DMake( latitude, longitude );
//			
//		}
//		
//	}
	
}

- (void)locationManager: (CLLocationManager *)manager
	   didFailWithError: (NSError *)error
{
	
	
}

- (void)locationManager: (CLLocationManager *)manager
	   didUpdateHeading: (CLHeading *)newHeading
{
	
	heading = newHeading.trueHeading;
	
}

//- (IBAction)button_Ima_Action:(id)sender
//{
//	
//	MKCoordinateRegion region;
//	MKCoordinateSpan span;
//	span.latitudeDelta = 0.005;
//	span.longitudeDelta = 0.005;
//	
//	region.span   = span;
//	region.center = CLLocationCoordinate2DMake( latitude, longitude );
//	
//	[self.mapView setRegion: region
//				   animated: YES];
//	
//}
//
//- (void)timer_Action: (NSTimer *)timer
//{
//	
//	if ( [app.array_Hata count] > 0 ) {
//		
//		[timer invalidate];
//		
//		[self addAnnotation_Hata];
//		
//	}
//	
//}
//
//- (void)addAnnotation_Hata
//{
//	
//	[self.mapView removeAnnotations: app.array_Hata];
//	[self.mapView removeAnnotations: app.array_HataOk];
//	
//	[self.mapView addAnnotations: app.array_Hata];
//	[self.mapView addAnnotations: app.array_HataOk];
//	
//}
//
//- (void)addAnnotation_Photo
//{
//	
//	[self.mapView removeAnnotations: app.array_Photo];
//	
//	[self.mapView addAnnotations: app.array_Photo];
//	
//}

//- (void)addAnnotation_Photo_Add
//{
//
//	[self.mapView addAnnotations: app.array_Photo_Add];
//
//	[app.array_Photo_Add removeAllObjects];
//
//}

//- (void)removeAnnotation_GPS
//{
//	
//	[self.mapView removeAnnotations: app.array_GPS];
//	
//}
//
//- (void)setAnnotation_GPS
//{
//	
//	CustomAnnotation_GPS *ca = app.array_GPS[0];
//	
//	ca.coordinate  = CLLocationCoordinate2DMake( latitude, longitude );// 34.074, 134.554 );	ca.no          = 1;
//	ca.title       = @"自分の現在位置";
//	ca.subtitle    = [NSString stringWithFormat: @"%f, %f", latitude, longitude];
//	ca.explanation = @"";
//	
//	[self.mapView addAnnotations: app.array_GPS];
//	
//}
//
//- (CustomAnnotation_GPS *)annotation_GPS
//{
//	
//	return app.array_GPS[0];
//	
//}
//
//- (void)setAnnotation_GPSOld
//{
//	
//	if ( app.bool_GPS_Old == NO ) return;
//	
//	[self.mapView removeAnnotations: app.array_GPSOld];
//	
//	[self.mapView addAnnotations: app.array_GPSOld];
//	
//}
//
//- (void)addAnnotation_GPSOld
//{
//	
//	if ( app.bool_GPS_Old == NO ) return;
//	
//	[self.mapView removeAnnotations: app.array_GPSOld];
//	
//	CustomAnnotation_GPS_Old *ca = [[CustomAnnotation_GPS_Old alloc] init];
//	
//	ca.coordinate  = CLLocationCoordinate2DMake( latitude, longitude );// 34.074, 134.554 );
//	ca.title       = @"自分の過去の位置";
//	ca.subtitle    = [NSString stringWithFormat: @"%f, %f", latitude, longitude];
//	ca.explanation = @"";
//	
//	[app.array_GPSOld addObject: ca];
//	
//	[self.mapView addAnnotations: app.array_GPSOld];
//	
//}

//- (void)addAnnotation_GPSOld_Add
//{
//
//	[self.mapView addAnnotations: app.array_GPSOld_Add];
//
//	[app.array_Photo_Add removeAllObjects];
//
//}

//- (CustomAnnotation_GPS_Old *)lastAnnotation_GPSOld
//{
//	
//	return [app.array_GPSOld lastObject];
//	
//}

@end
