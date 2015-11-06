//
//  Player.swift
//  Balling Falls
//
//  Created by Aaron Wong on 11/2/15.
//  Copyright © 2015 Aaron Wong. All rights reserved.
//

import UIKit
import SpriteKit

class Player: SKShapeNode {
    init(width: CGFloat, height: CGFloat) {
        super.init()
        self.path = CGPathCreateWithRect(CGRect(origin: CGPointZero, size: CGSize(width: width, height: height)), nil)
        
        self.fillColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.6)
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.frame.size)
        self.physicsBody!.dynamic = true
        self.physicsBody!.affectedByGravity = true
        self.physicsBody!.mass = 0.02
        self.physicsBody!.categoryBitMask = colliderTypePlayer
        self.physicsBody!.contactTestBitMask = colliderTypeBall
        self.physicsBody!.collisionBitMask = colliderTypeBall | colliderTypeWall
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}