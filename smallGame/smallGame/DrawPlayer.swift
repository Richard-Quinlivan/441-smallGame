//
//  DrawPlayer.swift
//  smallGame
//
//  Created by Richard Quinlivan on 3/24/21.
//

import UIKit

class DrawPlayer: UIView {

    let leftEdge:Double = 0
    let rightEdge:Double = Double(UIScreen.main.bounds.size.width)
    let topEdge:Double = 0
    let bottomEdge:Double = Double(UIScreen.main.bounds.size.height)
    let middle:Double = Double(UIScreen.main.bounds.size.width) / 2
    
    
    var drawX:Double = Double(UIScreen.main.bounds.size.width / 2) - 40
    var drawY:Double = Double(UIScreen.main.bounds.size.height / 2) - 40
    
    var dx:Double = 4
    var dy:Double = 4
    
    var canMove:Bool = true
    var gameOver:Bool = false
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let color1:UIColor = UIColor.blue
        let drect = CGRect(x:drawX, y:drawY, width:40, height:40)
        let bpath:UIBezierPath = UIBezierPath(rect: drect)

        color1.set()
        bpath.stroke()
        bpath.fill()
        
        
//        let color2:UIColor = UIColor.red
//        let obstacle = CGRect(x:middle, y:bottomEdge - 40, width:10, height:40)
//        let bpath2:UIBezierPath = UIBezierPath(rect: obstacle)
//
//        color2.set()
//        bpath2.stroke()
//        bpath2.fill()
    }

    
    @objc func update(){

        
       
        
        
        setNeedsDisplay()
    }
    
    func Reset(){
        
        gameOver = false
    }
}
