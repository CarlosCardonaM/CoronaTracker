//
//  DataModel.swift
//  Coronotracker
//
//  Created by Carlos Cardona on 26/12/20.
//

import Foundation

struct DataModel: Codable {
    
    var cases: Double
    var casesToday: Double
    var recovered: Double
    var deaths: Double
}
