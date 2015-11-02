//
//  GameScene.swift
//  Balling Falls
//
//  Created by Aaron Wong on 10/27/15.
//  Copyright (c) 2015 Aaron Wong. All rights reserved.
//

import SpriteKit

let BallCategoryName = "red-ball"

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        let borderBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        borderBody.friction = 0
        self.physicsBody = borderBody
        
        let ball = childNodeWithName(BallCategoryName) as! SKSpriteNode
        ball.physicsBody!.applyImpulse(CGVectorMake(100, -10))
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
