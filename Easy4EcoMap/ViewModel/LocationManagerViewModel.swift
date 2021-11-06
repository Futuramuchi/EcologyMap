//
//  LocationManagerViewModel.swift
//  Easy4EcoMap
//
//  Created by danyaq on 04.10.2021.
//

import SwiftUI
import CoreLocation
import MapKit

class LocationManagerViewModel: NSObject, CLLocationManagerDelegate, MKMapViewDelegate, ObservableObject{
    @Published var location: CLLocation? = nil
    @Published var center = CLLocationCoordinate2D()
    @Published var map = MKMapView()
    @Published var district = ""
    @Published var districtMain = ""
    @Published var address = ""
    @Published var searchText = ""
    @Published var searchModel: [SearchMapModel] = []
    let geo = CLGeocoder.init()
   
    private var locationManager = CLLocationManager()
    override init(){
        super.init()
        locationManager.delegate = self
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.headingFilter = kCLHeadingFilterNone
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
    }
    func coordinateToAddress(lat: Double, lon: Double){
        geo.reverseGeocodeLocation(CLLocation.init(latitude: lat, longitude:lon)) { (places, error) in
                if error == nil{
                    if let place = places{
                        DispatchQueue.main.async {
                            self.address = ("\(place.first?.thoroughfare ?? "") \(place.first?.subThoroughfare ?? "")")
                            self.district = place.first?.subLocality?.localizedCapitalized ?? ""
                           
                        }
                        
                        
                        
                        
                    }
                }
            }
    }
    
    func coordinateToLocation(lat: Double, lon: Double){
        geo.reverseGeocodeLocation(CLLocation.init(latitude: lat, longitude: lon)) { (places, error) in
                if error == nil{
                    if let place = places{
                        if self.districtMain.isEmpty{
                        DispatchQueue.main.async{[weak self] in
                            
                            self?.districtMain = place.first?.subLocality?.localizedCapitalized ?? ""
                            print(place.first?.subLocality?.localizedCapitalized ?? "no")
                            
                        }
                        }
                    }
                }
            }
    
    }
    
    func mapSearch(){
        searchModel.removeAll()
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        MKLocalSearch(request: request).start { response, error in
            if error != nil{
                print(error?.localizedDescription ?? "error")
                return
            } else {
                guard let result = response else { return }
                self.searchModel = result.mapItems.compactMap({ item -> SearchMapModel? in
                    return SearchMapModel(place: item.placemark)
                })
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.location = location
    }
}


