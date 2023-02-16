import Foundation

struct Service {
    
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }
    
    func fetchList(of user: String, completion: @escaping ([Repository]?) -> Void) {
        
        // TODO
        guard let url =  URL(string: "https://api.github.com/users/\(user)/repos") else {return}
        network.performGet(url: url, completion: {(data) in
            
            let users = try! JSONDecoder().decode([Repository].self, from: data!)
            
            DispatchQueue.main.async {
                completion(users)
            }
            
        })
    }
}
