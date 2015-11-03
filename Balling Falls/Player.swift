//
//  Player.swift
//  Balling Falls
//
//  Created by Aaron Wong on 11/2/15.
//  Copyright © 2015 Aaron Wong. All rights reserved.
//

import UIKit
import SpriteKit

class Player: SKSpriteNode {
    init() {
        let player = SKTexture(imageNamed: "player1")
        super.init(texture: player, color: SKColor.clearColor(), size: player.size())
        animate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func animate() {
        var playerTextures: [SKTexture] = []
        for i in 1...2 {
            playerTextures.append(SKTexture(imageNamed: "player\(i)"))
        }
        let playerAnimation = SKAction.repeatActionForever(SKAction.animateWithTextures(playerTextures, timePerFrame: 0.1))
        self.runAction(playerAnimation)
    }
}
