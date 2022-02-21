//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var questionLabel: UILabel!
  @IBOutlet var progressBar: UIProgressView!
  @IBOutlet var trueButton: UIButton!
  @IBOutlet var falseButton: UIButton!
  @IBOutlet var scoreLabel: UILabel!
  
  var quizBrain = QuizBrain()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateUI()
    
  }
  
  @IBAction func answerButtonPressed(_ sender: UIButton) {
    
    let userAnswer = sender.currentTitle!
    
    
    if quizBrain.checkAnswer(userAnswer) {
      sender.backgroundColor = .green
    } else {
      sender.backgroundColor = .red
    }
    
    quizBrain.nextQuestion()
    
    updateUI()
  }
  
  func updateUI() {
    questionLabel.text = quizBrain.getQuestionText()
    scoreLabel.text = "Score: \(quizBrain.score)"
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
      self.trueButton.backgroundColor = .clear
      self.falseButton.backgroundColor = . clear
      self.progressBar.progress = self.quizBrain.getProgress()
    }
  }
  
}

