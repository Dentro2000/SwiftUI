import Foundation

protocol NetworkingProtocol {
    func request(router: Router, completion: @escaping (Result<ShiftsData, NetworkingError>) -> ())
}

struct NetworkingManager: NetworkingProtocol {
    
    func request(router: Router, completion: @escaping (Result<ShiftsData, NetworkingError>) -> ()) {
        
        let url = composeURLformComponents(router: router)
        
        URLSession.shared.dataTask(with: url) {  result in
            
            switch result {
            case .success(let data):
                switch data.shifts {
                case .success(let shifts):
                    DispatchQueue.main.async {
                        completion(.success(shifts))
                    }
                    
                case .failure(let error):
                    completion(.failure(error as! NetworkingError))
                }
                
            case .failure(let error):
                completion(.failure(.badRequest(description: error.localizedDescription)))
            }
            
            
        }.resume()
    }
    
    private func composeURLformComponents(router: Router) -> URL {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.queryItems
        
        guard let url = components.url else { preconditionFailure(Strings.urlComposingFailed.rawValue) }
        return urlFromURLRequest(url: url, router: router)
    }
    
    private func urlFromURLRequest(url: URL, router: Router ) -> URL {
        var request = URLRequest(url: url)
        request.httpMethod = router.method
        guard let url = request.url else { preconditionFailure(Strings.urlGeneratingFailed.rawValue)}
        return url
    }
    
}
