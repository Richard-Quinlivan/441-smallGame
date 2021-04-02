//
//  GameScene.swift
//  smallGame
//
//  Created by Richard Quinlivan on 3/26/21.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player = SKSpriteNode()
    var goal = SKSpriteNode()
    var orientation = SKLabelNode()
    
    var gravityValue:CGFloat = -9.81

    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "player")! as! SKSpriteNode
        goal = self.childNode(withName: "goal")! as! SKSpriteNode
        orientation = self.childNode(withName: "orientation") as! SKLabelNode
        
        
        let boarder = SKPhysicsBody(edgeLoopFrom: self.frame)
        boarder.friction = 0
        boarder.restitution = 1
        
        self.physicsBody = boarder
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
//        print("Collision")
    }
    
    func youWin(){
        print("You Win")
    }
    
    func changeGravity(){
        orientation.text = String(UIDevice.current.orientation.rawValue)
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
