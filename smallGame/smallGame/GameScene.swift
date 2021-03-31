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

    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "player")! as! SKSpriteNode
        goal = self.childNode(withName: "goal")! as! SKSpriteNode

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
        print("Collision")
    }
    
    func youWin(){
        print("You Win")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
