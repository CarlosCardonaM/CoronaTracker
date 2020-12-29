//
//  Case.swift
//  Coronotracker
//
//  Created by Carlos Cardona on 26/12/20.
//

import Foundation

struct Case: Decodable {
    
    var country: String
    var cases: Double
    var todayCases: Double
    var recovered: Double
    var deaths: Double
    var todayDeaths: Double
    var active: Double
    var critical: Double
    var casesPerOneMillion: Double
    var deathsPerOneMillion: Double
    var tests: Double
    
//    var countryInfo: [info]
    
    
    
    
    var stringCases: String {
        quitDecimal(for: cases)
    }
    var stringTodayCases: String {
        quitDecimal(for: todayCases)
    }
    var stringDeaths: String {
        quitDecimal(for: deaths)
    }
    var stringRecovered: String {
        quitDecimal(for: recovered)
    }
    var stringTodayDeaths: String {
        quitDecimal(for: deaths)
    }
    var stringActive: String {
        quitDecimal(for: deaths)
    }
    var stringCritical: String {
        quitDecimal(for: deaths)
    }
    var stringCasesPerOneMillion: String {
        quitDecimal(for: deaths)
    }
    var stringDeathsPerOneMillion: String {
        quitDecimal(for: deaths)
    }
    var stringTests: String {
        quitDecimal(for: tests)
    }


    func quitDecimal(for data: Double) -> String {
        return String(format: "%.0f", data)
    }
}





//
//struct info: Decodable {
//    var flag: String
//}





























struct WorldCases: Decodable {
    
    
    var cases: Double
    var todayCases: Double
    var recovered: Double
    var deaths: Double
    
    var stringCases: String {
        quitDecimal(for: cases)
    }
    
    var stringTodayCases: String {
        quitDecimal(for: todayCases)
    }
    
    var stringRecovered: String {
        quitDecimal(for: recovered)
    }
    
    var stringDeaths: String {
        quitDecimal(for: deaths)
    }


    func quitDecimal(for data: Double) -> String {
        return String(format: "%.0f", data)
    }
}
