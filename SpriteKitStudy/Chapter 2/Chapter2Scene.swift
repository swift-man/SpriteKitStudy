//
//  Chapter2Scene.swift
//  SpriteKitStudy
//
//  Created by SwiftMan on 12/9/23.
//

import SpriteKit
import GameplayKit

class Chapter2Scene: SKScene {
  
  private var label : SKLabelNode?
  private var spinnyNode : SKShapeNode?
  
  override func didMove(to view: SKView) {
    self.anchorPoint = .zero
    
    self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
    
    let bee = SKSpriteNode()
    bee.size = CGSize(width: 28, height: 24)
    bee.position = CGPoint(x: 250, y: 250)
    self.addChild(bee)
    
    let beeAtlas = SKTextureAtlas(named: "Chapter2")
    
    let beeFrames: [SKTexture] = [
      beeAtlas.textureNamed("bee"),
      beeAtlas.textureNamed("bee-fly")
    ]
    
    let flyAction = SKAction.animate(with: beeFrames,
                                     timePerFrame: 0.14)
    
    let beeAction = SKAction.repeatForever(flyAction)
    bee.run(beeAction)
  }
}
