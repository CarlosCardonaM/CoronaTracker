//
//  DetailsViewController.swift
//  Coronotracker
//
//  Created by Carlos Cardona on 28/12/20.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var casesLabel: UILabel!
    @IBOutlet weak var todayCases: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var todayDeathsLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var criticalLabel: UILabel!
    @IBOutlet weak var casesPOMLabel: UILabel!
    @IBOutlet weak var deathsPOMLabel: UILabel!
    @IBOutlet weak var testsLabel: UILabel!
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    
    var dataManager = DataManager()
    
    var homeVC = HomeViewController()
    
    
//    var countryInfo = [CountryInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.isCountry = true
        
        dataManager.delegate = self
        
//        dataManager.updateData(for: "Mexico")
        
        dataManager.updateData(for: "Mexico")
        
        
        
        
        
    }
    
    func configureFlagImageView(image: UIImageView, stringURL: String?) {
        
        if stringURL != nil {
            if let url = URL(string: stringURL!) {
                if let data = try? Data(contentsOf: url) {
                    image.image = UIImage(data: data)
                }
            }
        }
        
    }

}

extension DetailsViewController: DataManagerDelegate {
    
    func didUpdateData(_ dataManager: DataManager, data: Case) {
        
        DispatchQueue.main.async {

            self.casesLabel.text = data.stringCases
            self.todayCases.text = data.stringTodayCases
            self.deathsLabel.text = data.stringDeaths
            self.todayDeathsLabel.text = data.stringTodayDeaths
            self.recoveredLabel.text = data.stringRecovered
            self.activeLabel.text = data.stringActive
            self.criticalLabel.text = data.stringCritical
            self.casesPOMLabel.text = data.stringCasesPerOneMillion
            self.deathsPOMLabel.text = data.stringDeathsPerOneMillion
            self.testsLabel.text = data.stringTests
            self.countryLabel.text = data.country
            
            
            if let url = URL(string: "") {
                if let data = try? Data(contentsOf: url) {
                    self.flagImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    func didFailWithError(error: Error) {
        print("Error:::::: \(error)")
    }
    
    
}
