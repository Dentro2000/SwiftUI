import Foundation

struct Router {
    
    let date: Date
    
    init(date: Date = Date() ) {
        self.date = date
    }
    
    var scheme: String {
        return Strings.RouterStrings.scheme.rawValue
    }
    
    var host:String {
        return Strings.RouterStrings.host.rawValue
    }
    
    var path: String {
        return Strings.RouterStrings.path.rawValue
    }
    
    var queryItems: [URLQueryItem] {
        
        return [URLQueryItem(name:Strings.RouterStrings.start.rawValue, value: date.formmated),
                URLQueryItem(name:Strings.RouterStrings.type.rawValue, value: "week"),
                URLQueryItem(name:Strings.RouterStrings.address.rawValue, value: "Dallas, TX"),
        ]
        
    }
    
    var method: String {
        Strings.RouterStrings.method.rawValue
    }
    
}
