import UIKit
import MapKit

class ServiceViewController: UIViewController {
    
    
    @IBOutlet weak var myMapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showMapType2(lat: 13.606352, long:100.765416)
        //showMap(lat: 13.606352, long:100.765416)
    } //Main Method
    
    func showMapType2(lat: Double, long: Double) -> Void {
        
        let latitude:CLLocationDegrees = lat
        let longtitude:CLLocationDegrees = long
        
        let laDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: laDelta, longitudeDelta: longDelta)
        let Office:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: Office, span: span)
        
        
        self.myMapView.setRegion(region, animated: true)
        
        //Office Anotation
        let OfficeAnotation = MKPointAnnotation()
        OfficeAnotation.coordinate = Office
        OfficeAnotation.title = "HITACHI TRANSPORT SYSTEM VANTEC"
        OfficeAnotation.subtitle = "Head Office (BLC)"
        self.myMapView.addAnnotation(OfficeAnotation)
        
        //Bus Stop
        
        let latBranch:CLLocationDegrees = 13.573096
        let longtBranch:CLLocationDegrees = 100.765745
        let BranchStopAnotation = MKPointAnnotation()
        BranchStopAnotation.coordinate = CLLocationCoordinate2D(latitude: latBranch, longitude: longtBranch)
        BranchStopAnotation.title = "HITACHI TRANSPORT SYSTEM VANTEC"
        BranchStopAnotation.subtitle = "(BLC5)"
        self.myMapView.addAnnotation(BranchStopAnotation)
        
    }
    
    
    func showMap(lat: Double,long: Double) -> Void {
        
        let homeCoordinate = CLLocationCoordinate2DMake(lat, long)
        let regionDistance: CLLocationDistance = 1000
        let regionSpan = MKCoordinateRegion.init(center: homeCoordinate, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placeMark = MKPlacemark(coordinate: homeCoordinate)
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.name = "Home"
        mapItem.openInMaps(launchOptions: options)
    }
    
} // Main Class
