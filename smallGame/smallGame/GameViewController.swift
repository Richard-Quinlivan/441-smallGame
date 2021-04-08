//
//  GameViewController.swift
//  smallGame
//
//  Created by Richard Quinlivan on 3/26/21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                // Present the scene
                view.presentScene(scene)
            }
            
//            let story = UIStoryboard(name: "Main", bundle:nil)
//            let vc = self
            UIApplication.shared.windows.first?.rootViewController = self
            UIApplication.shared.windows.first?.makeKeyAndVisible()
            
            
            view.ignoresSiblingOrder = true

//            view.showsFPS = true
//            view.showsNodeCount = true
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "ToEndScreen"){
//            let endScreen = segue.destination as! EndViewController
//            
//        }
//    }
//
//    override var shouldAutorotate: Bool {
//        return true
//    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
