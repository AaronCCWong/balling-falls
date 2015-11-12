//
//  Player.swift
//  Balling Falls
//
//  Created by Aaron Wong and Derek Chan on 11/2/15.
//  Copyright © 2015 Aaron Wong and Derek Chan. All rights reserved.
//

import UIKit
import SpriteKit

//var playerStandingFrames : [SKTexture]!
//let playerStandingAtlas = SKTextureAtlas(named: "PlayerStandingImages")
//var standFrames = [SKTexture]()

class Player: SKSpriteNode {
    init() {
//        let numImages = playerStandingAtlas.textureNames.count
//        for var i = 1; i <= numImages/2; i++ {
//            let playerTextureName = "Standing\(i)"
//            standFrames.append(playerStandingAtlas.textureNamed(playerTextureName))
//        }
//        
//        playerStandingFrames = standFrames
//        let texture = playerStandingFrames[0]
        let texture = SKTexture(imageNamed: "Standing1")
        super.init(texture: texture, color: SKColor.whiteColor(), size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: 90, height: 90))
        self.physicsBody!.dynamic = true
        self.physicsBody!.affectedByGravity = true
        self.physicsBody!.mass = 0.02
        self.physicsBody!.categoryBitMask = colliderTypePlayer
        self.physicsBody!.contactTestBitMask = colliderTypeBall
        self.physicsBody!.collisionBitMask = colliderTypeWall | colliderTypeBall | colliderTypeRoadBlock
    }
    
//    func standing() {
//        self.runAction(SKAction.repeatActionForever(
//            SKAction.animateWithTextures(playerStandingFrames,
//                timePerFrame: 1,
//                resize: false,
//                restore: true)),
//            withKey:"standingInPlacePlayer")
//    }
}