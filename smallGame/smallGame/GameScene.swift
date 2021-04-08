//
//  GameScene.swift
//  smallGame
//
//  Created by Richard Quinlivan on 3/26/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player = SKSpriteNode()
    var goal = SKSpriteNode()
    public var timer = SKLabelNode()
    
    var gravityValue:CGFloat = -9.81

    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "player")! as! SKSpriteNode
        goal = self.childNode(withName: "goal")! as! SKSpriteNode
        timer = self.childNode(withName: "Timer")! as! SKLabelNode
        
        let x: CGFloat = self.frame.origin.x
        let y: CGFloat = self.frame.origin.y + 100
        let width = self.frame.width
        let height = self.frame.height - 200
        
        let outsideEdge = CGRect(x: x, y: y, width: width, height: height)

        let boarder = SKPhysicsBody(edgeLoopFrom: outsideEdge)
        boarder.friction = 0
        boarder.restitution = 0.6
        
        self.physicsBody = boarder
        
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(changeTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func changeTimer(){
        let floatTimer = Float(timer.text!)
        timer.text = String(format: "%.1f", floatTimer! + 0.1)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        guard let nodeA = contact.bodyA.node else {return}
        guard let nodeB = contact.bodyB.node else {return}
        
        if(nodeA.name == "player" && nodeB.name == "goal"){
            youWin()
        }
        else if (nodeA.name == "goal" && nodeB.name == "player"){
            youWin()
        }
    }
    
    func youWin(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.time = Float(String(timer.text!))!
        self.view?.window?.rootViewController?.performSegue(withIdentifier: "ToEndScreen", sender: Any?.self)
    }
    
    func changeGravity(){
//        orientation.text = String(UIDevice.current.orientation.rawValue)
        switch (UIDevice.current.orientation){
        case .landscapeLeft:
            physicsWorld.gravity = CGVector(dx: gravityValue, dy: 0)
            break
        case .landscapeRight:
            physicsWorld.gravity = CGVector(dx: -gravityValue, dy: 0)
            break
        case .portrait:
            physicsWorld.gravity = CGVector(dx: 0, dy: gravityValue)
            break
        case .portraitUpsideDown:
            physicsWorld.gravity = CGVector(dx: 0, dy: -gravityValue)
            break
        case .unknown:
            break
        case .faceUp:
            break
        case .faceDown:
            break
        @unknown default:
            break
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        changeGravity()
    }
}
