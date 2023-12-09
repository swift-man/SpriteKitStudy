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
  
  let bee = SKSpriteNode()
  
  let ground = Ground()
  
  override func didMove(to view: SKView) {
    self.anchorPoint = .zero
    
    self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
    
    self.camera = cam
    
    self.addTheFlyingBee()
    
    let bee2 = Bee()
    bee2.position = CGPoint(x: 325, y: 325)
    self.addChild(bee2)
    
    let bee3 = Bee()
    bee3.position = CGPoint(x: 200, y: 325)
    self.addChild(bee3)
    
    ground.position = CGPoint(x: -self.size.width * 2, y: 100)
    
    ground.size = CGSize(width: self.size.width * 6, height: 0)
    ground.createChildren()
    self.addChild(ground)
  }
  
  override func didSimulatePhysics() {
    self.camera!.position = bee.position
  }
  
  func addTheFlyingBee() {
    bee.size = CGSize(width: 28, height: 24)
    bee.position = CGPoint(x: 250, y: 250)
    self.addChild(bee)
    
    let beeAtlas = SKTextureAtlas(named: "Enemies")
    
    let beeFrames: [SKTexture] = [
      beeAtlas.textureNamed("bee"),
      beeAtlas.textureNamed("bee-fly")
    ]
    
    let flyAction = SKAction.animate(with: beeFrames,
                                     timePerFrame: 0.14)
    
    let beeAction = SKAction.repeatForever(flyAction)
    bee.run(beeAction)
    
    let pathLeft = SKAction.moveBy(x: -200,
                                   y: -10,
                                   duration: 2)
    let pathRight = SKAction.moveBy(x: 200,
                                    y: 10,
                                    duration: 2)
    
    let flipTextureNegative = SKAction.scaleX(to: -1, duration: 0)
    let flipTexturePositive = SKAction.scaleX(to: 1, duration: 0)
    
    let flightOfTheBee = SKAction.sequence([
      pathLeft,
      flipTextureNegative,
      pathRight,
      flipTexturePositive
    ])
    
    let neverEndingFlight = SKAction.repeatForever(flightOfTheBee)
    
    bee.run(neverEndingFlight)
  }
}
