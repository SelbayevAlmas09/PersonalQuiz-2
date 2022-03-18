//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    private var animalsCount: [Animal: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let resultedAnimal = getResultAnimal(Answers: answersChosen)
        
        titleLabel.text = "Вы - \(resultedAnimal.rawValue)"
        descriptionLabel.text = resultedAnimal.definition
    }
    
    private func getResultAnimal(Answers: [Answer]) -> Animal {
        let animals = answersChosen.map {$0.animal}
        
        for animal in animals {
            if !animalsCount.keys.contains(animal) {
                animalsCount[animal] = 1
            } else {
                animalsCount[animal]! += 1
            }
        }
        
        return animalsCount.sorted {$0.1 > $1.1}.first?.key ?? .dog
    }
}
