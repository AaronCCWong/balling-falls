//
//  Ball.swift
//  Balling Falls
//
//  Created by Aaron Wong on 11/5/15.
//  Copyright © 2015 Aaron Wong. All rights reserved.
//

import UIKit
import SpriteKit

class Ball: SKShapeNode {
    init(circleOfRadius: CGFloat) {
        super.init()
        
        let diameter = circleOfRadius * 2
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
        let randomHeight = Int(arc4random_uniform(100)) + 500
        let randomXVelocity = CGFloat(arc4random_uniform(300)) + 100
        
        self.position = CGPoint(x: 0, y: randomHeight)
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
        self.physicsBody!.applyImpulse(CGVectorMake(randomXVelocity, -10))
    }
}