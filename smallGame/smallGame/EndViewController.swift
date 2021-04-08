//
//  EndViewController.swift
//  smallGame
//
//  Created by Richard Quinlivan on 4/7/21.
//

import UIKit

class EndViewController: UIViewController {
    
    @IBOutlet var table : UITableView!
    @IBOutlet var clearButton : UIButton!
    
    let file = "data.txt"
    let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

    var scores = [Float]()
    override func viewDidLoad() {
        
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let score = Float(appDelegate.time)
        

        if (dir != nil) {

            let fileURL = dir!.appendingPathComponent(file)


            do {
                let data = try String(contentsOf: fileURL, encoding: .utf8)
                var nextNumber : String = ""
                for char in data{
                    if(char != ","){
                        nextNumber += String(char)
                    }
                    else{
                        addScore(score: Float(nextNumber)!)
                        nextNumber = ""
                    }
                }
            }
            catch {/* error handling here */}
        }
        
        
        addScore(score: score)
    }
    
    @IBAction func clear(){
        scores.removeAll()
        table.reloadData()
        if (dir != nil) {

            let fileURL = dir!.appendingPathComponent(file)

            do {
                let text = ""
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
    }
    
    @IBAction func returnToStart(){
        if (dir != nil) {

            let fileURL = dir!.appendingPathComponent(file)

            do {
                var text = ""
                for score in scores{
                    text += String(score)
                    text += ","
                }
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
    }
    
    func addScore(score : Float){
//        print(score)
        scores.append(score)
//        print(scores)
        table.reloadData()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
extension EndViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
}

extension EndViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        
        cell.textLabel?.text = String(scores[indexPath.row])
        return cell
    }
}
