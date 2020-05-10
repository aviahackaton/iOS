struct PolygonsResponse: Decodable {
    let coordinates: [Coordinates]
    let type: String
    let name: String?
    
    struct Coordinates: Decodable {
        let lat: Double
        let lng: Double
//        
//        enum CodingKeys: String, CodingKey {
//            case lat, lng
//        }
//        
//        init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//            lat = Double(try container.decode(String.self, forKey: .lat))!
//            lng = Double(try container.decode(String.self, forKey: .lng))!
//        }
    }
}
