//
//  NetworkManager.swift
//  AlomafireApp
//
//  Created by Yevhen Shevchenko on 17.12.2020.
//

import Foundation
import Alamofire

enum URLS: String {
    case nbu = "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json"
    case posts = "https://jsonplaceholder.typicode.com/posts"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(completionHandler: @escaping ([Currency]) -> Void) {
        
        /* VALIDATION
         AF.request(URLS.nbu.rawValue).responseJSON { dataResponse in
             guard let statusCode = dataResponse.response?.statusCode else { return }
             
             if (200...300).contains(statusCode) {
                 guard let value = dataResponse.value else { return }
                 print(value)
             } else {
                 guard let error = dataResponse.error else { return }
                 print(error)
             }
         }
         */
        
        /*
         AF.request(URLS.nbu.rawValue).validate().responseJSON { dataResponse in
             switch dataResponse.result {
             case .success(let value):
                 guard let values = value as? [[String: Any]] else { return }
                 
                 for value in values {
                     let object = Currency(
                         number: value["r030"] as? Int,
                         currency: value["txt"] as? String,
                         rate: value["rate"] as? Float,
                         code: value["cc"] as? String,
                         exchangeDate: value["exchangedate"] as? String
                     )
                     currency.append(object)
                 }
                 
                 DispatchQueue.main.async {
                     completionHandler(currency)
                 }
                 
             case .failure(let error):
                 print(error)
             }
         }
         */
        
        AF.request(URLS.nbu.rawValue).validate().responseJSON { dataResponse in
            switch dataResponse.result {
            case .success(let value):
                let currency = Currency.getValues(from: value) ?? []
                
                DispatchQueue.main.async {
                    completionHandler(currency)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
