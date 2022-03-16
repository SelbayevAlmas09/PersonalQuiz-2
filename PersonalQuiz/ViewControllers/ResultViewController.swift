//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var backNavigationItem: UINavigationItem!
    
    var answersChosen: [Answer]!
    var animalsCount: [Animal: Int] = [.dog : 0, .cat : 0, .rabbit : 0, .turtle : 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backNavigationItem.hidesBackButton = true
        
        let animals = answersChosen.map {$0.animal}
        
        for animal in animals {
            animalsCount[animal]! += 1
        }
        
        let resultedAnimal = animalsCount.sorted {$0.1 > $1.1}.first?.key ?? .dog
        
        titleLabel.text = "Вы - \(resultedAnimal.rawValue)"
        descriptionLabel.text = resultedAnimal.definition
    }
}
