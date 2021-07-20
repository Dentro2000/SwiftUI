import Foundation

extension Data {
    var shifts: Result<ShiftsData, Error> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return Result {
            try decoder.decode(ShiftsData.self, from: self)
        }
    }
}
