//
//  Ground.swift
//  SpriteKitStudy
//
//  Created by SwiftMan on 12/9/23.
//

import Foundation
import SpriteKit

class Ground: SKSpriteNode, GameSprite {
  var textureAtlas = SKTextureAtlas(named: "Environment")
  
  var initialSize: CGSize = .zero
  
  func onTap() {
    
  }
  
  func createChildren() {
    self.anchorPoint = CGPoint(x: 0, y: 1)
    
    let texture = textureAtlas.textureNamed("ground")
    
    var tileCount: CGFloat = 0
    let tileSize = CGSize(width: 35, height: 300)
    
    while tileCount * tileSize.width < self.size.width {
      let tileNode = SKSpriteNode(texture: texture)
      tileNode.size = tileSize
      tileNode.position.x = tileCount * tileSize.width
      
      tileNode.anchorPoint = CGPoint(x: 0, y: 1)
      
      self.addChild(tileNode)
      
      tileCount += 1
    }
  }
}
