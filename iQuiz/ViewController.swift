//
//  TableViewCellMenu.swift
//  iQuiz
//
//  Created by zichu zheng on 11/7/17.
//  Copyright © 2017 zichu zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBAction func settingPress(_ sender: Any) {
        let alert = UIAlertController(title: "Setting", message: "Setting goes here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    let itemMenu = ["Science", "Super Heroes", "Mathematics"]
    var questions = ["Q1", "Q2"]
    var answers = [["A11", "A12", "A13", "A14"], ["A21", "A22", "A23", "A24"]]
    var correctAnswers = [2, 3]
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (itemMenu.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        cell.myImage.image = UIImage(named: (itemMenu[indexPath.row] + ".jpg"))
        cell.myLabel.text = itemMenu[indexPath.row]
        cell.descriptionLabel.text = itemMenu[indexPath.row] + " description"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        if (index == 0) {
            questions = ["What is fire?"]
            answers = [[
                "One of the four classical elements",
                "A magical reaction given to us by God",
                "A band that hasn't yet been discovered",
                "Fire! Fire! Fire! heh-heh"
                ]]
            correctAnswers = [0]
        } else if (index == 1) {
            questions = ["Who is Iron Man?", "Who founded the X-Men?", "How did Spider-Man get his powers?"]
            answers = [[
                "Tony Stark",
                "Obadiah Stane",
                "A rock hit by Megadeth",
                "Nobody knows"
                ],
                       [
                        "Tony Stark",
                        "Professor X",
                        "The X-Institute",
                        "Erik Lensherr"
                ],
                       [
                        "He was bitten by a radioactive spider",
                        "He ate a radioactive spider",
                        "He is a radioactive spider",
                        "He looked at a radioactive spider"
                ]
            ]
            correctAnswers = [0, 1, 0]
            
        } else if (index == 2) {
            questions = ["What is 2+2?"]
            answers = [[
                "4",
                "22",
                "An irrational number",
                "Nobody knows"
                ]]
            correctAnswers = [0]
        }
        
        performSegue(withIdentifier: "showQuestion", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as? QuestionViewController
        let totalQNumber = questions.count
        let currentQNumber = 0
        nextVC?.totalQNumber = totalQNumber
        nextVC?.currentQnumber = currentQNumber
        nextVC?.questions = questions
        nextVC?.answers = answers
        nextVC?.correctAnswers = correctAnswers
        nextVC?.userScore = 0
    }
    
}

