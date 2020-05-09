import MapKit

final class MapViewDelegate: NSObject, MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolygonRenderer(overlay: overlay)
        if let polygon = overlay as? Polygon {
            let color = polygon.color ?? .orange
            renderer.strokeColor = color
            renderer.fillColor = color.withAlphaComponent(0.3)
        }
        renderer.lineWidth = 3
        return renderer
    }
}
