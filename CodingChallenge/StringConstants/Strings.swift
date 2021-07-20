import Foundation


enum Strings: String {
    case yes = "Yes"
    case no = "No"
    case empty = ""
    
    case urlComposingFailed = "Url composing failed"
    case urlGeneratingFailed = "Url generating failed"
    case dateFormat = "yyyy-MM-dd"
    
    enum RouterStrings: String {
        case scheme = "https"
        case host = "dev.shiftkey.com"
        case path = "/api/v2/available_shifts"
        case start = "start"
        case type = "type"
        case address = "address"
        case method = "GET"
    }
    
    enum ShiftCell: String {
        case premiumRate = "🤑 Premium Rate!"
        case covidShift = "😷 Covid Shift"
        case distance = "🚗 distance:  "
        
    }
    
    enum DetailsScreen: String {
        case shiftDetails = "Shift Details"
        case covid = "Covid?"
        case premium = "Premium?"
        case distance = "Distance from Dallas City Hall:"
        case start = "Start Date:"
        case end = "End Date:"
        case facility = "Facility Type:"
        case skill = "Skill:"
        case speciality = "Speciality:"
    }
    
    enum ShiftsView: String {
        case navBarTitle = "Shifts"
        case noShifts = "There no avilable shifts 🤷🏻‍♂️. Tap to reset"
    }
    
    enum AccesibilityIdentifiers: String {
        case gridHeader = "gridHeader"
    }
}

