//
//  GameStartScene.swift
//  Balling Falls
//
//  Created by Aaron Wong and Derek Chan on 11/9/15.
//  Copyright © 2015 Aaron Wong and Derek Chan. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation

class GameStartScene: SKScene {
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        self.backgroundColor = SKColor.whiteColor()
        let scoreText = SKLabelNode(fontNamed: "IndieFlower")
        scoreText.fontSize = 50
        scoreText.fontColor = SKColor.blackColor()
        scoreText.text = "Balling Falls"
        scoreText.position = CGPoint(x: size.width / 2 - 10, y: size.height / 2 + 20)
        self.addChild(scoreText)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func update(currentTime: CFTimeInterval) {
    }
}
