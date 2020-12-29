//
//  WorldViewController.swift
//  Coronotracker
//
//  Created by Carlos Cardona on 26/12/20.
//

import UIKit

class WorldViewController: UIViewController {
    
    var dataManager = DataManager()
    
    @IBOutlet weak var casesLabel: UILabel!
    @IBOutlet weak var todaysCasesLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.worldDelegate = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dataManager.isCountry = false
        
        dataManager.updateData(for: "")
    }

}

extension WorldViewController: WorldDataManagerDelegate {
    
    func didUpdateData(_ dataManager: DataManager, data: WorldCases) {
        DispatchQueue.main.async {
            self.casesLabel.text = data.stringCases
            self.todaysCasesLabel.text = data.stringTodayCases
            self.recoveredLabel.text = data.stringRecovered
            self.deathLabel.text = data.stringDeaths
        }
    }
    
    func didFailWithError(error: Error) {
        print("Error::: \(error)")
    }
    
    
}
