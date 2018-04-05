//
//  ProfileViewController.swift
//  WhatIAm
//
//  Created by Shailendra Suriyal on 4/4/18.
//  Copyright © 2018 intimetec. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

  var mapView: MKMapView?
  
  var locationManager: CLLocationManager?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    loadMapView()
    
  }
  
  func loadMapView() {
    
    mapView = MKMapView(frame: self.view.frame)
    mapView?.delegate = self
    mapView?.showsUserLocation = true
    self.view.addSubview(mapView!)
    
   // locationManager? = CLLocationManager()
    locationManager = CLLocationManager()
    locationManager?.delegate = self
    locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    locationManager?.requestAlwaysAuthorization()
    
    if CLLocationManager.locationServicesEnabled(){
      locationManager?.startUpdatingLocation()
    }
//    locationManager?.delegate = self
//    locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//    locationManager?.requestWhenInUseAuthorization()
//    locationManager?.requestAlwaysAuthorization()
//    locationManager?.startUpdatingLocation()
    
    
    let latitude : CLLocationDegrees = 28.5244
    let longitude : CLLocationDegrees = 77.1855
    
    //Zoom in level of the mapView
    let latDelta : CLLocationDegrees = 0.05
    let lonDelta : CLLocationDegrees = 0.05
    
    //span combination of lat delta and lon delta
    let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
    
    let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    //region = combinaton of location and span
    let region : MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
    
    mapView?.setRegion(region, animated: true)
    
    let annotation :MKPointAnnotation = MKPointAnnotation()
    annotation.coordinate = location
    annotation.title = "Qutab Minar"
    annotation.subtitle = "Visited tons of times. . ."
    mapView?.addAnnotation(annotation)
    
    let uiLPGR = UILongPressGestureRecognizer(target: self, action: #selector(MapsViewController.longPress(gestureRecogmizer:)));
    uiLPGR.minimumPressDuration = 1
    mapView?.addGestureRecognizer(uiLPGR)
  }
  
  @objc func longPress(gestureRecogmizer : UILongPressGestureRecognizer ) {
    
    let touchPoint = gestureRecogmizer.location(in: self.mapView)
    let coordinate = mapView?.convert(touchPoint, toCoordinateFrom: mapView)
    let userAnnotation : MKPointAnnotation = MKPointAnnotation()
    userAnnotation.coordinate = coordinate!
    userAnnotation.title = "New Place "
    userAnnotation.subtitle = "\(coordinate?.latitude), \(coordinate?.longitude)"
    mapView?.addAnnotation(userAnnotation)
    
    
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    print("shailu")
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    print(locations)
    
    let userLocation : CLLocation = locations[0]
    
    let latitude = userLocation.coordinate.latitude
    let longitude = userLocation.coordinate.longitude
    
    
    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    let userAnnotation : MKPointAnnotation = MKPointAnnotation()
    userAnnotation.coordinate = coordinate
    userAnnotation.title = "New Place "
    userAnnotation.subtitle = "\(coordinate.latitude), \(coordinate.longitude)"
    mapView?.addAnnotation(userAnnotation)
    
    mapView?.userTrackingMode = MKUserTrackingMode.follow
    
  }
  
}
