//
//  Player.swift
//  Balling Falls
//
//  Created by Aaron Wong and Derek Chan on 11/2/15.
//  Copyright © 2015 Aaron Wong and Derek Chan. All rights reserved.
//

import UIKit
import SpriteKit

class Player: SKSpriteNode {
    init() {
        let texture = SKTexture(imageNamed: "Standing1")
        super.init(texture: texture, color: SKColor.whiteColor(), size: texture.size())
        self.standingAnimate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 90, height: 90))
        self.physicsBody!.dynamic = true
        self.physicsBody!.affectedByGravity = true
        self.physicsBody!.mass = 0.02
        self.physicsBody!.allowsRotation = false
        self.physicsBody!.categoryBitMask = ColliderType.colliderTypePlayer.rawValue
        self.physicsBody!.contactTestBitMask = ColliderType.colliderTypeBall.rawValue
        self.physicsBody!.collisionBitMask = ColliderType.colliderTypeWall.rawValue | ColliderType.colliderTypeBall.rawValue | ColliderType.colliderTypeRoadBlock.rawValue
    }
    
    func standingAnimate() {
        var playerTextures: [SKTexture] = []
        for i in 0...3 {
            playerTextures.append(SKTexture(imageNamed: "Standing\(i)"))
        }
        playerTextures.append(SKTexture(imageNamed: "Standing2"))
        playerTextures.append(SKTexture(imageNamed: "Standing1"))
        let playerAnimation = SKAction.repeatActionForever(SKAction.animateWithTextures(playerTextures, timePerFrame: 0.1))
        self.runAction(playerAnimation)
    }
}