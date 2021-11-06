//
//  MainMapView.swift
//  Easy4EcoMap
//
//  Created by danyaq on 04.10.2021.
//

import SwiftUI
import MapKit


struct MainMapView: View {
    @EnvironmentObject var locationViewModel: LocationManagerViewModel
    @EnvironmentObject var htmlParser: HTMLParser
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack{
    
            MapView()
                .environmentObject(locationViewModel)
                .environmentObject(htmlParser)
                .ignoresSafeArea()
            Image("pin")
                .resizable()
                .frame(width: 45, height: 45)
            Button {
                if locationViewModel.location?.coordinate != nil {
                locationViewModel.map.setRegion(MKCoordinateRegion(center: locationViewModel.map.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
                }
            } label: {
                ZStack{
                    Circle()
                        .frame(width: 45, height: 45)
                        .foregroundColor(Color.init("Theme"))
                     
                    Image(systemName: "location.fill")
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding()

        }
    }
}

struct MapView: UIViewRepresentable{
    @EnvironmentObject var locationViewModel: LocationManagerViewModel
    @EnvironmentObject var htmlParser: HTMLParser
    func makeUIView(context: Context) -> MKMapView {
        let map = locationViewModel.map
        map.delegate = context.coordinator
        map.showsUserLocation = true
        map.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.618423), span: .init(latitudeDelta: 0.4, longitudeDelta: 0.4))
        
//        let ann = MKPointAnnotation()
//        ann.coordinate = CLLocationCoordinate2D(latitude: 55.8, longitude: 37.44)
//        map.addAnnotation(ann)
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return MapView.Coordinator(selectedStation: stations[0], htmlParser: htmlParser, locationViewModel: locationViewModel)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate{
        var selectedStation: StationModel
        var htmlParser: HTMLParser
        var locationViewModel: LocationManagerViewModel
        init(selectedStation: StationModel,htmlParser: HTMLParser, locationViewModel: LocationManagerViewModel){
            self.selectedStation = selectedStation
            self.locationViewModel = locationViewModel
            self.htmlParser = htmlParser
        }
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
                locationViewModel.coordinateToAddress(lat: mapView.centerCoordinate.latitude, lon: mapView.centerCoordinate.longitude)
                locationViewModel.center = mapView.centerCoordinate
               
          
            
        }
       
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            UserDefaults.standard.removeObject(forKey: "station")
            if view.annotation is MKUserLocation{
                //для пина, который является локацией пользователя
                mapView.setRegion(MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 1000, longitudeDelta: 1000)), animated: true)
            } else {
                //для пина, который не является локацией пользователя
                if (view.annotation?.coordinate.latitude) != nil && (view.annotation?.coordinate.longitude) != nil{
                    mapView.setCenter(CLLocationCoordinate2D(latitude: view.annotation!.coordinate.latitude, longitude: view.annotation!.coordinate.longitude), animated: true)
                    selectedStation = stations.first(where: { $0.longitude == view.annotation?.coordinate.longitude ?? 0}) ?? stations[0]
                    UserDefaults.standard.set(selectedStation.title, forKey: "station")
                    
                }
                
            }
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let view = MKAnnotationView()
            if annotation is MKUserLocation == false{
                view.image = UIImage(named: "marker-icon")
                view.frame = .init(x: 0, y: 0, width: 40, height: 40)
                return view
            } else {
                view.image = UIImage(named: "userl")
                view.frame = .init(x: 0, y: 0, width: 55, height: 55)
                return view
            }
        }
        
        func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
            for station in stations{
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: station.latitude, longitude: station.longitude)
                mapView.addAnnotation(annotation)
            }
            
        }
       
        
    }
}
