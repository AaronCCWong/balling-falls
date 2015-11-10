//
//  DeathBall.swift
//  Balling Falls
//
//  Created by Aaron Wong on 11/10/15.
//  Copyright © 2015 Aaron Wong and Derek Chan. All rights reserved.
//

import UIKit
import SpriteKit

class DeathBall: SKShapeNode {
    override init() {
        super.init()
        
        let randomRadius = CGFloat(arc4random_uniform(25)) + 1
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
    
    func addPhysics(position: CGPoint) {
        let randomVelocity = CGFloat(arc4random_uniform(800))
        
        self.position = position
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.frame.size.width/2)
        self.physicsBody!.friction = 0
        self.physicsBody!.restitution = 0.95
        self.physicsBody!.linearDamping = 0.01
        self.physicsBody!.angularDamping = 0
        self.physicsBody!.mass = 0.5
        self.physicsBody!.dynamic = true
        self.physicsBody!.categoryBitMask = colliderTypeBall
        self.physicsBody!.contactTestBitMask = colliderTypePlayer | colliderTypeBall
        self.physicsBody!.collisionBitMask = colliderTypeWall | colliderTypeBall
        self.physicsBody!.applyImpulse(CGVectorMake(randomVelocity - 400, randomVelocity - 400))
    }
}