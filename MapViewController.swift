//
//  MapViewController.swift
//  EatAround
//
//  Created by aiolos404 on 2/10/15.
//  Copyright (c) 2015 aiolos404. All rights reserved.
//

import UIKit

class MapViewController: UIViewController,GMSMapViewDelegate,CLLocationManagerDelegate {
    
    
    let locationManager =  CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        
        var camera = GMSCameraPosition.cameraWithLatitude(41.8760,
            longitude:-87.6266, zoom:11)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
        
        mapView.delegate = self
        
        mapView.myLocationEnabled = true
        mapView.mapType = kGMSTypeHybrid
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        //        mapView.settings.scrollGestures = false
        self.view = mapView
    }
    
    

    
//    func mapView(mapView: GMSMapView!, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
//        NSLog("You tapped at %f,%f", coordinate.latitude, coordinate.longitude)
//        var marker = GMSMarker()
//        var currentZoom = mapView.camera.zoom;
//        mapView.clear()
//        marker.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude)
//        marker.title = "Your location"
//        marker.snippet = "Chicago"
//        marker.infoWindowAnchor = CGPointMake(0.5, 0.5)
//        marker.icon = UIImage(named: "house")
//        marker.map = mapView
//        var movePosition = GMSCameraPosition.cameraWithLatitude(coordinate.latitude,
//            longitude: coordinate.longitude, zoom: currentZoom)
//        mapView.camera = movePosition
//        
//    }
//    
//    func locationManager(manager:CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus){
//        if status == .AuthorizedWhenInUse{
//            
//            locationManager.startUpdatingLocation()
//
//        }
//    }
    
    

    
    func didTapMyLocationButtonForMapView(mapView: GMSMapView!) -> Bool {
        NSLog("You tapped at location button")
        return false
    }
    
}