//
//  Player.swift
//  Balling Falls
//
//  Created by Aaron Wong and Derek Chan on 11/2/15.
//  Copyright © 2015 Aaron Wong and Derek Chan. All rights reserved.
//

import UIKit
import SpriteKit

class Player: SKShapeNode {
    init(width: Double, height: Double) {
        super.init()
        self.path = CGPathCreateWithRect(CGRect(origin: CGPointMake(10.0, -20.0), size: CGSize(width: width, height: height)), nil)
        
        self.fillColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.6)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.frame.size)
        self.physicsBody!.dynamic = true
        self.physicsBody!.affectedByGravity = true
        self.physicsBody!.mass = 0.02
        self.physicsBody!.categoryBitMask = colliderTypePlayer
        self.physicsBody!.contactTestBitMask = colliderTypeBall
        self.physicsBody!.collisionBitMask = colliderTypeWall | colliderTypeBall
    }
}