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
    var blockPosition: CGPoint?
    
    init(position: CGPoint) {
        super.init()
        blockPosition = position
        
        self.path = CGPathCreateWithRect(CGRect(origin: position, size: CGSize(width: 200, height: 100)), nil)
        self.strokeColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.6)
        self.fillColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.6)
        self.lineWidth = 4
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPhysics() {
        self.position = blockPosition!
        self.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 200, height: 100))
        self.physicsBody!.dynamic = true
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.mass = 100
        self.physicsBody!.categoryBitMask = ColliderType.colliderTypeRoadBlock.rawValue
        self.physicsBody!.contactTestBitMask = ColliderType.colliderTypePlayer.rawValue
        self.physicsBody!.collisionBitMask = ColliderType.colliderTypePlayer.rawValue | ColliderType.colliderTypeWall.rawValue
    }
}