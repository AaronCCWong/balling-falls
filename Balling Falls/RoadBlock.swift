//
//  RoadBlock.swift
//  Balling Falls
//
//  Created by Aaron Wong and Derek Chan on 11/12/15.
//  Copyright © 2015 Aaron Wong and Derek Chan. All rights reserved.
//

import UIKit
import SpriteKit

class RoadBlock: SKShapeNode {
    init(position: CGPoint) {
        super.init()
        self.path = CGPathCreateWithRect(CGRect(origin: position, size: CGSize(width: 10, height: 100)), nil)
        self.strokeColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.6)
        self.fillColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.6)
        self.lineWidth = 4
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 100, height: 100))
        self.physicsBody!.dynamic = true
        self.physicsBody!.affectedByGravity = true
        self.physicsBody!.mass = 100
        self.physicsBody!.categoryBitMask = colliderTypeRoadBlock
        self.physicsBody!.collisionBitMask = colliderTypeWall
    }
}