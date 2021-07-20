import SwiftUI

final class ShiftsViewModel: ObservableObject {
    
    let networkingManager: NetworkingProtocol
    @Published var shifts = [Shifts]()
    private var weekNumber = 0
    
    init(networkingManager:NetworkingProtocol = NetworkingManager()) {
        self.networkingManager = networkingManager
        
        fetchShifts(week: weekNumber)
    }
    
    //Increment week number to fetch future weeks
    func incrementCounter() -> Int {
        weekNumber += 1
        print(weekNumber)
        return weekNumber
    }
    
    //Reset week number to fetch current week
    func resetCounter() -> Int {
        weekNumber = 0
        return weekNumber
    }
    
    //Returns date with the specyfied week, to be fetched from API
    private func computeWeek(_ weekNumber: Int) -> Date {
        return Calendar.current.date(byAdding: .weekOfYear, value: weekNumber, to: Date()) ?? Date()
    }
    
    //Fetches shifts from provided date
    func fetchShifts(week: Int) {
        networkingManager.request(router: Router(date: computeWeek(week))) { result in
            switch result {
            case .success(let succes):
                self.shifts = succes.data
            case .failure(let error):
                print(error)
            }
        }
    }
}
