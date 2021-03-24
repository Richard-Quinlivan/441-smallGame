//
//  ViewController.swift
//  smallGame
//
//  Created by Richard Quinlivan on 3/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var drawPlayer : DrawPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let displayLink = CADisplayLink(target: self, selector: #selector(self.update))
        displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.default)
    }


    @objc func update(){
        drawPlayer.update()
    }
}

