struct MockShift {
    static let mockShift = Shift(shiftId: 123456,
                                 startTime: "2021-07-31T19:00:00+00:00",
                                 endTime: "2021-08-01T03:00:00+00:00",
                                 normalizedStartDateTime:  "2021-07-31 14:00:00",
                                 normalizedEndDateTime: "2021-07-31 22:00:00",
                                 timezone: "Central",
                                 premiumRate: true,
                                 covid: false,
                                 shiftKind: "Evening Shift",
                                 withinDistance: 50,
                                 facilityType: facilityType,
                                 skill: MockShift.skillType,
                                 localizedSpecialty: MockShift.localizedSpeciality)
    
    static let facilityType = FacilityType(id: 8,
                                           name: "Skilled Nursing Facility",
                                           color: "#AF52DE",
                                           abbreviation: nil)
    
    static let skillType = FacilityType(id: 2,
                                        name: "Long Term Care",
                                        color:  "#007AFF",
                                        abbreviation: nil)
    
    static let localizedSpeciality = LocalizedSpecialty(id: 154,
                                                        specialtyId: 8,
                                                        stateId: 44,
                                                        name:  "Licensed Vocational Nurse",
                                                        abbreviation: "LVN",
                                                        specialty: MockShift.specialityType)
    
    static let specialityType = SpecialityType(id: 8,
                                               name: "Licensed Vocational/Practical Nurse",
                                               color: "#AF52DE",
                                               abbreviation: "LVN/LPN")
}
