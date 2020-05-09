struct PolygonsResponse: Decodable {
    let coordinates: [Coordinates]
    let type: String
    let name: String?
    
    struct Coordinates: Decodable {
        let lat: Double
        let lon: Double
    }
}
