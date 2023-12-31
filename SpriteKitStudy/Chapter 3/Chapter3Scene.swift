//
//  Chapter3Scene.swift
//  SpriteKitStudy
//
//  Created by SwiftMan on 12/9/23.
//

import SpriteKit
import GameplayKit

class Chapter3Scene: SKScene {
  
  let cam = SKCameraNode()
  
  let player = Player()
  
  let ground = Ground()
  
  override func didMove(to view: SKView) {
    self.anchorPoint = .zero
    
    self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
    
    self.camera = cam
    
    let bee2 = Bee()
    
    bee2.position = CGPoint(x: 325, y: 325)
    self.addChild(bee2)
    
    bee2.physicsBody?.mass = 0.2
    bee2.physicsBody?.applyImpulse(CGVector(dx: -25, dy: 0))
    
    let bee3 = Bee()
    bee3.position = CGPoint(x: 200, y: 325)
    self.addChild(bee3)
    
    ground.position = CGPoint(x: -self.size.width * 2, y: 100)
    
    ground.size = CGSize(width: self.size.width * 6, height: 0)
    ground.createChildren()
    self.addChild(ground)
    
    player.position = CGPoint(x: 150, y: 250)
    self.addChild(player)
  }
  
  override func didSimulatePhysics() {
    self.camera!.position = player.position
  }
}
