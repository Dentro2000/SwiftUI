extension Array where Element == Shifts {
    
    var filterEmptyDays:[Shifts] {filter { $0.shifts.isNotEmpty }}
    
    var allDaysEmpty:Bool { allSatisfy { $0.shifts.isEmpty }}
}

extension Array {
    var isNotEmpty: Bool {
        return !isEmpty
    }
}
