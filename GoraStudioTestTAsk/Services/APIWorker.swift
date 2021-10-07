//
//  ApiWorker.swift
//  GoraStudioTestTAsk
//
//  Created by Кирилл Тарасов on 06.10.2021.
//

import Foundation

class APIWorker {
    
    private let dispatchQueue = DispatchQueue(label: "myDispatchQueue",
                                              qos: .utility,
                                              attributes: .concurrent)
    private let semaphore = DispatchSemaphore(value: 0)
    static let shared = APIWorker()
    private let urlSession = URLSession.shared
    
    typealias FetchDataResult = (Data?, URLResponse?, Error?) -> Void
    
    func fetchData(from url: URL, completion: @escaping FetchDataResult) {
        dispatchQueue.async {
            [unowned self] in
            self.urlSession.dataTask(with: url) { (data, response, error) in
                completion(data, response, error)
                self.semaphore.signal()
            }.resume()
            _ = self.semaphore.wait(wallTimeout: .distantFuture)
        }
    }
    
    private init() {}
}
