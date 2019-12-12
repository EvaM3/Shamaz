//
//  ViewController.swift
//  SHAMAZ!
//
//  Created by Eva Madarasz on 10.12.19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var futureButton: UIButton!
    @IBOutlet weak var pastButton: UIButton!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var nextFriendButton: UIButton!
    @IBOutlet weak var userLabel: UILabel!
    
   
    let names =  ["Attila","Bela","Agnes","Irene","Chris","Evie","Jeanette","Nicole"].shuffled()
    let futureQuestions =  ["What will you do in","Where will you be in","Who do you meet in the next","What's your plan in","What is your goal for the next"].shuffled()
    
    let pastQuestions = ["What have you done the last","What was your best memory from last","Where have you been last", "What was the highlight from last", "Your favorite person from the last"].shuffled()
    let timeFrames = ["month","week","day","hour","year"].shuffled()
    let maxTimeFrameNumber = 12
 

    var nameSelector = 0
    var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.futureButton.layer.cornerRadius = 15
        self.futureButton.backgroundColor = .white
        self.futureButton.layer.borderColor = UIColor.black.cgColor
        self.futureButton.layer.borderWidth = 2
        self.pastButton.layer.cornerRadius = 5
        self.pastButton.backgroundColor = .white
        self.pastButton.layer.borderColor = UIColor.black.cgColor
        self.pastButton.layer.borderWidth = 2
        self.storyLabel.layer.cornerRadius = 25
        self.storyLabel.backgroundColor = .white
        self.userLabel.layer.borderColor = UIColor.blue.cgColor
        self.userLabel.layer.borderWidth = 1
        self.nextFriendButton.layer.borderColor = UIColor.black.cgColor
        self.nextFriendButton.layer.borderWidth = 2
        backgroundImage = UIImageView(frame: view.frame)
        backgroundImage.image = UIImage(named:"Water")
        self.backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        
        futureButton.isEnabled = true
        futureButton.showsTouchWhenHighlighted = true
        pastButton.isEnabled = true
        pastButton.showsTouchWhenHighlighted = true
        
        futureButton.isHidden = true
        pastButton.isHidden = true
        
    }
    func toggleButtons() {
        futureButton.isHidden = !futureButton.isHidden
        pastButton.isHidden = !pastButton.isHidden
        nextFriendButton.isHidden = !nextFriendButton.isHidden
    }
    
    func makeRandomElement(fromList: [String]) -> String {
        let randomIndex = Int.random(in:1...fromList.count-1)
        return fromList[randomIndex]
    }
    
    func makeRandomQuestion(fromList: [String]) -> String {
        let randomNumber = Int.random(in:1...maxTimeFrameNumber)
        var timeFrame = timeFrames[0]
        if randomNumber > 1 {
            timeFrame = timeFrame + "s"
        }
        
        let fullQuestion = "\(makeRandomElement(fromList: fromList)) \(randomNumber) \(timeFrame)?"
        
        return fullQuestion
    }
    
    @IBAction func pastButtonPressed(_ sender: Any) {
        storyLabel.text = makeRandomQuestion(fromList: pastQuestions)
        toggleButtons()
    }
    
    @IBAction func futureButtonPressed(_ sender: Any) {
        storyLabel.text = makeRandomQuestion(fromList: futureQuestions)
        toggleButtons()
    }
    
    
    @IBAction func nextFriendButtonPressed(_ sender: Any) {
        userLabel.text = names[nameSelector]
        nameSelector = nameSelector + 1
        if nameSelector == names.count {
            nameSelector = 0
        }
        toggleButtons()
        
    }
    
}
