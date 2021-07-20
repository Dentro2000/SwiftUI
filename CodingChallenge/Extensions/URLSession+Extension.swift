import Foundation

extension URLSession {
    func dataTask(
        with url: URL,
        handler: @escaping (Result<Data, Error>) -> Void
    ) -> URLSessionDataTask {
        dataTask(with: url) { data, _, error in
            if let error = error {
                handler(.failure(error))
            } else {
                guard let data = data else { return handler(.failure(NetworkingError.dataError)) }
                handler(.success(data))
            }
        }
    }
}
