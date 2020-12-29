//
//  GetData.swift
//  Coronotracker
//
//  Created by Carlos Cardona on 26/12/20.
//

import Foundation

protocol DataManagerDelegate {
    func didUpdateData(_ dataManager: DataManager, data: Case)
    func didFailWithError(error: Error)
}

protocol WorldDataManagerDelegate {
    func didUpdateData(_ dataManager: DataManager, data: WorldCases)
    func didFailWithError(error: Error)
}

struct DataManager {
    
    var isCountry = true
    var status = ""
    
    let worldUrl = "https://corona.lmao.ninja/v2/all"
    let countryUrl = "https://corona.lmao.ninja/v2/countries/"
    
    
    var delegate: DataManagerDelegate?
    var worldDelegate: WorldDataManagerDelegate?
    
    func updateData(for country: String) {
        
        if isCountry {
            if let url = URL(string: countryUrl + country) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
                    
                    guard error == nil else {
                        delegate?.didFailWithError(error: error!)
                        return
                    }
                    
                    if let safeData = data {
                        if let results = parseJSON(safeData) {
                            delegate?.didUpdateData(self, data: results)
                        }
                    }
                }
                task.resume()
            }
            
        } else {
            
            if let url = URL(string: worldUrl) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
                    
                    guard error == nil else {
                        delegate?.didFailWithError(error: error!)
                        return
                    }
                    
                    if let safeData = data {
                        if let results = parseWorldJSON(safeData) {
                            worldDelegate?.didUpdateData(self, data: results)
                        }
                    }
                }
                task.resume()
            }
        }
        
    }
    
    
    
    
    func parseJSON(_ data: Data) -> Case? {
        
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(Case.self, from: data)
            
            
            
            let cases = decodedData.cases
            let todayCases = decodedData.todayCases
            let recovered = decodedData.recovered
            let deaths = decodedData.deaths
            let todayDeaths = decodedData.todayDeaths
            let active = decodedData.active
            let critical = decodedData.critical
            let casesPOM = decodedData.casesPerOneMillion
            let deathsPOM = decodedData.deathsPerOneMillion
            let tests = decodedData.tests
            
//            let countryInfo = decodedData.countryInfo
            
            let country = decodedData.country
            
            
            let results = Case(country: country, cases: cases, todayCases: todayCases, recovered: recovered, deaths: deaths, todayDeaths: todayDeaths, active: active, critical: critical, casesPerOneMillion: casesPOM, deathsPerOneMillion: deathsPOM, tests: tests)
            
            return results
            
        } catch {
            
            print("Error ::::::::::\(error)")
            return nil
        }
    }
    
    func parseWorldJSON(_ data: Data) -> WorldCases? {
        
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(WorldCases.self, from: data)
            

            
            let cases = decodedData.cases
            let todayCases = decodedData.todayCases
            let recovered = decodedData.recovered
            let deaths = decodedData.deaths
            
            
            let results = WorldCases(cases: cases, todayCases: todayCases, recovered: recovered, deaths: deaths)
            
            return results
            
        } catch {
            
            print("::::::::::\(error)")
            return nil
        }
    }
}
