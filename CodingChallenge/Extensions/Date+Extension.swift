import Foundation

extension Date {
    //returns string in "yyyy-mm-dd" from Date
    var formmated: String {
        let formatter = DateFormatter()
        formatter.dateFormat = Strings.dateFormat.rawValue
        return formatter.string(from: self)
    }
}
