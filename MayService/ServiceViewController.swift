import UIKit
import MapKit
import CoreLocation


class ServiceViewController: UIViewController {
    
    
    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var LabelLat: UILabel!
    @IBOutlet weak var LabelLon: UILabel!
    
    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        checkLocationServices()
        
//        showMapType2(lat: 13.606352, long:100.765416)
        //showMap(lat: 13.606352, long:100.765416)
        
        
        
    } //Main Method
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        TextFieldLat.Text = locationManager.delegate.
    }
    
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            myMapView.setRegion(region, animated: true)
//            print("Lat ==> \(location.latitude)")
//            print("Long ==> \(location.longitude)")
            LabelLat.text = String(location.latitude)
            LabelLon.text = String(location.longitude)
            
            
            
        }
    }
    
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            myMapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        }
    }
    
//    func showMapType2(lat: Double, long: Double) -> Void {
//
//        let latitude:CLLocationDegrees = lat
//        let longtitude:CLLocationDegrees = long
//
//        let laDelta:CLLocationDegrees = 0.01
//        let longDelta:CLLocationDegrees = 0.01
//
//        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: laDelta, longitudeDelta: longDelta)
//        let Office:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
//        let region:MKCoordinateRegion = MKCoordinateRegion(center: Office, span: span)
//
//
//        self.myMapView.setRegion(region, animated: true)
//
//        //Office Anotation
//        let OfficeAnotation = MKPointAnnotation()
//        OfficeAnotation.coordinate = Office
//        OfficeAnotation.title = "HITACHI TRANSPORT SYSTEM VANTEC"
//        OfficeAnotation.subtitle = "Head Office (BLC)"
//        self.myMapView.addAnnotation(OfficeAnotation)
//
//        //Bus Stop
//
//        let latBranch:CLLocationDegrees = 13.573096
//        let longtBranch:CLLocationDegrees = 100.765745
//        let BranchStopAnotation = MKPointAnnotation()
//        BranchStopAnotation.coordinate = CLLocationCoordinate2D(latitude: latBranch, longitude: longtBranch)
//        BranchStopAnotation.title = "HITACHI TRANSPORT SYSTEM VANTEC"
//        BranchStopAnotation.subtitle = "(BLC5)"
//        self.myMapView.addAnnotation(BranchStopAnotation)
//
//    }
//
//
//    func showMap(lat: Double,long: Double) -> Void {
//
//        let homeCoordinate = CLLocationCoordinate2DMake(lat, long)
//        let regionDistance: CLLocationDistance = 1000
//        let regionSpan = MKCoordinateRegion.init(center: homeCoordinate, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
//        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
//
//        let placeMark = MKPlacemark(coordinate: homeCoordinate)
//        let mapItem = MKMapItem(placemark: placeMark)
//        mapItem.name = "Home"
//        mapItem.openInMaps(launchOptions: options)
//    }
    
} // Main Class
extension ServiceViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let region = MKCoordinateRegion.init(center: location.coordinate, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        myMapView.setRegion(region, animated: true)
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}
