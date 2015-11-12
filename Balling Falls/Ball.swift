//
//  Ball.swift
//  Balling Falls
//
//  Created by Aaron Wong and Derek Chan on 11/5/15.
//  Copyright © 2015 Aaron Wong and Derek Chan. All rights reserved.
//

import UIKit
import SpriteKit

class Ball: SKShapeNode {
    var isGameOver: Bool?
    init(gameOver: Bool) {
        super.init()
        isGameOver = gameOver
        
        let randomRadius = CGFloat(arc4random_uniform(25)) + 10
        let diameter = randomRadius * 2
        self.path = CGPathCreateWithEllipseInRect(CGRect(origin: CGPointZero, size: CGSize(width: diameter, height: diameter)), nil)
        
        let red = self.randomRGB()
        let green = self.randomRGB()
        let blue = self.randomRGB()
        self.strokeColor = UIColor(red: red, green: green, blue: blue, alpha: 0.6)
        self.fillColor = UIColor(red: red, green: green, blue: blue, alpha: 0.6)
        self.lineWidth = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func randomRGB() -> CGFloat {
        return CGFloat(drand48())
    }
    
    func addPhysics() {
        var xVelocity: CGFloat?
        var yVelocity: CGFloat?
        
        if isGameOver == true {
            self.position = playerPosition!
            xVelocity = direction() * randomVelocity()
            yVelocity = direction() * randomVelocity()
        } else {
            let randomHeight = Int(arc4random_uniform(100)) + 500
            self.position = CGPoint(x: -20, y: randomHeight)
            xVelocity = randomVelocity()
            yVelocity = -10
        }
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.frame.size.width/2)
        self.physicsBody!.friction = 0
        self.physicsBody!.restitution = 0.95
        self.physicsBody!.linearDamping = 0.01
        self.physicsBody!.angularDamping = 0
        self.physicsBody!.mass = 0.5
        self.physicsBody!.dynamic = true
        self.physicsBody!.categoryBitMask = colliderTypeBall
        self.physicsBody!.contactTestBitMask = colliderTypePlayer
        self.physicsBody!.collisionBitMask = colliderTypeWall | colliderTypePlayer
        self.physicsBody!.applyImpulse(CGVectorMake(xVelocity!, yVelocity!))
    }
    
    func direction() -> CGFloat {
        if arc4random_uniform(10) < 5 {
            return CGFloat(1);
        }
        return CGFloat(-1);
    }
    
    func randomVelocity() -> CGFloat {
        return CGFloat(arc4random_uniform(300)) + 100
    }
}