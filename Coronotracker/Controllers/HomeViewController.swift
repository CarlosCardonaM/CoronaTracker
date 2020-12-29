//
//  HomeViewController.swift
//  Coronotracker
//
//  Created by Carlos Cardona on 26/12/20.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var casesLabel: UILabel!
    @IBOutlet weak var todaysCasesLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel!
    
    var textField = UITextField()
    
    var dataManager = DataManager()
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dataManager.delegate = self
        
        dataManager.updateData(for: "mexico")
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        dataManager.isCountry = true
        
        
        
    }
    
    @IBAction private func SearchBarButtonTapped(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Search a Country", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Search", style: .default, handler: { (action) in
            if let textF = self.textField.text {
                
                self.dataManager.updateData(for: textF)
                
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter a Country"
            alertTextField.autocapitalizationType = .words
            self.textField = alertTextField
            
        }
        
        present(alert, animated: true)
    }
    
    @IBAction private func moreButtonTapped(_ sender: UIButton) {
        
    }
    
    
    @IBAction private func favoritesBarButtonTapped(_ sender: UIBarButtonItem) {
        
        
    }
    


}

extension HomeViewController: DataManagerDelegate {
    
    func didUpdateData(_ dataManager: DataManager, data: Case) {
        
        DispatchQueue.main.async {
            self.casesLabel.text = data.stringCases
            self.todaysCasesLabel.text = data.stringTodayCases
            self.recoveredLabel.text = data.stringRecovered
            self.deathLabel.text = data.stringDeaths
            self.countryLabel.text = data.country
        }
        
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}



