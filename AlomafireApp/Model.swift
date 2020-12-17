//
//  Model.swift
//  AlomafireApp
//
//  Created by Yevhen Shevchenko on 17.12.2020.
//

import Foundation

struct Currency: Decodable {
    let number: Int?
    let currency: String?
    let rate: Float?
    let code: String?
    let exchangeDate: String?

    init(value: [String: Any]) {
        number = value["r030"] as? Int
        currency = value["txt"] as? String
        rate = value["rate"] as? Float
        code = value["cc"] as? String
        exchangeDate = value["exchangedate"] as? String
    }

    static func getValues(from value: Any) -> [Currency]? {
        var currency: [Currency] = []

        guard let values = value as? [[String: Any]] else { return nil}

        for value in values {
            let object = Currency(value: value)
            currency.append(object)
        }

        return currency
    }
}
