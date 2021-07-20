import Foundation

// MARK: - ShiftData
struct ShiftsData: Codable {
    let data: [Shifts]
    let links: [String]
    let meta: Meta
}

// MARK: - Shifts
struct Shifts: Codable {
    let date: String
    let shifts: [Shift]
}

// MARK: - Shift
struct Shift: Codable {
    
    let shiftId: Int
    let startTime, endTime: String
    let normalizedStartDateTime, normalizedEndDateTime, timezone: String
    let premiumRate, covid: Bool
    let shiftKind: String
    let withinDistance: Int
    let facilityType, skill: FacilityType
    let localizedSpecialty: LocalizedSpecialty
}

// MARK: - FacilityType
struct FacilityType: Codable {
    let id: Int
    let name: String
    let color: String
    let abbreviation: String?
}

// MARK: - SpecialityType
struct SpecialityType: Codable {
    let id: Int
    let name: String
    let color: String
    let abbreviation: String?
}


// MARK: - LocalizedSpecialty
struct LocalizedSpecialty: Codable {
    let id, specialtyId, stateId: Int
    let name, abbreviation: String
    let specialty: SpecialityType
}

// MARK: - Meta
struct Meta: Codable {
    let lat, lng: Double
}
