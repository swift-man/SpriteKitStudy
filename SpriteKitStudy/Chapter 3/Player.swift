//
//  Player.swift
//  SpriteKitStudy
//
//  Created by SwiftMan on 12/10/23.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode, GameSprite {
  var textureAtlas = SKTextureAtlas(named: "Pierre")
  
  var initialSize = CGSize(width: 64, height: 64)
  
  var flyAnimation = SKAction()
  var soarAnimation = SKAction()
  
  init() {
    super.init(texture: nil,
               color: .clear,
               size: initialSize)
    
    createAnimations()
    self.run(flyAnimation, withKey: "flapAnimation")
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func createAnimations() {
    let rotateUpAction = SKAction.rotate(toAngle: 0, duration: 0.475)
    rotateUpAction.timingMode = .easeOut
    
    let rotateDownAction = SKAction.rotate(toAngle: -1, duration: 0.8)
    rotateDownAction.timingMode = .easeOut
    
    let flyFrames: [SKTexture] = [
      textureAtlas.textureNamed("pierre-flying-1"),
      textureAtlas.textureNamed("pierre-flying-2"),
      textureAtlas.textureNamed("pierre-flying-3"),
      textureAtlas.textureNamed("pierre-flying-4"),
      textureAtlas.textureNamed("pierre-flying-3"),
      textureAtlas.textureNamed("pierre-flying-2"),
    ]
    
    let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.03)
    
    flyAnimation = SKAction.group([
      SKAction.repeatForever(flyAction),
      rotateUpAction
    ])
    
    let soarFrames: [SKTexture] = [textureAtlas.textureNamed("pieree-flying-1")]
    
    let soarAction = SKAction.animate(with: soarFrames, timePerFrame: 1)
    
    soarAnimation = SKAction.group([
      SKAction.repeatForever(soarAction),
      rotateDownAction
    ])
  }
  
  func onTap() {
    
  }
  
  func update() {}
  
}
