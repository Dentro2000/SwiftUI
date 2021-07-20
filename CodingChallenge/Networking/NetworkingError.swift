import Foundation

enum NetworkingError: Error {
    case badURL
    case badRequest(description: String)
    case decodingError
    case dataError
}
