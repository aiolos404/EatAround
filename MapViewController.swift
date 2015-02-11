//
//  MapViewController.swift
//  EatAround
//
//  Created by aiolos404 on 2/10/15.
//  Copyright (c) 2015 aiolos404. All rights reserved.
//

import UIKit

class MapViewController: UIViewController,GMSMapViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var camera = GMSCameraPosition.cameraWithLatitude(-33.86, longitude: 151.20, zoom: 6)
//        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
//        mapView.myLocationEnabled = true
//        mapView.mapType = kGMSTypeHybrid
//        
////        var mapInsets = UIEdgeInsetsMake(300.0,300.0, 300.0, 300.0)
////        mapView.padding = mapInsets
////        
//        
//        self.view = mapView
//        
//        var marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
//        marker.title = "Chicago"
//        marker.snippet = "American"
//        marker.map = mapView
    }
    
    
    override func loadView() {
        var camera = GMSCameraPosition.cameraWithLatitude(41.8760,
            longitude:-87.6266, zoom:11)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
       
        mapView.delegate = self
        
        mapView.myLocationEnabled = true
        mapView.mapType = kGMSTypeHybrid
        
        self.view = mapView
        
        
//        var marker = GMSMarker()
////        marker.position = CLLocationCoordinate2DMake(41.8760, -87.6266)
//        marker.title = "Chicago"
//        marker.snippet = "American"
//        marker.map = mapView
    }
    
    // MARK: GMSMapViewDelegate
    
    func mapView(mapView: GMSMapView!, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        NSLog("You tapped at %f,%f", coordinate.latitude, coordinate.longitude)
        var marker = GMSMarker()
        mapView.clear()
        marker.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude)
        marker.title = "Your location"
//        marker.snippet = "American"
        marker.map = mapView
        
    }
}