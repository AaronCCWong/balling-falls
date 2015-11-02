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
    var balls: [SKSpriteNode] = []
    
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        let borderBody = SKPhysicsBody(edgeLoopFromRect: CGRect(x: 0,y: 0, width: self.frame.size.width + 300, height: self.frame.size.height))
        borderBody.friction = 0
        self.physicsBody = borderBody
        
        let ball = childNodeWithName(BallCategoryName) as! SKSpriteNode
        balls.append(ball)
        ball.physicsBody!.applyImpulse(CGVectorMake(100, -9.8))
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if balls[0].position.x >= 1100 {
            balls[0].removeFromParent()
        }
    }
}
