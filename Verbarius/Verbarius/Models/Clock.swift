//
//  Clock.swift
//  Verbarius
//
//  Created by Medyannik Dmitri on 30.03.2024.
//

import Foundation

struct Clock: Decodable {
    let options: [ClockOptions]
}

struct ClockOptions: Decodable {
    var time: String
    var value1 : String?
    var value2 : String?
    var value3 : String?
    var value4 : String?
    var value5 : String?
    var value6 : String?
    var value7 : String?
    var value8 : String?
    var value9 : String?
    var value10 : String?
    var value11 : String?
    
    private enum CodingKeys: String, CodingKey {
        case time = "clock"
        case value1 = "value_1"
        case value2 = "value_2"
        case value3 = "value_3"
        case value4 = "value_4"
        case value5 = "value_5"
        case value6 = "value_6"
        case value7 = "value_7"
        case value8 = "value_8"
        case value9 = "value_9"
        case value10 = "value_10"
        case value11 = "value_11"
    }
}

func loadJson(filename fileName: String) -> [ClockOptions] {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([ClockOptions].self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
            return []
        }
    }
    return []
}
