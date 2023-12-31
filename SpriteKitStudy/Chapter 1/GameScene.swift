//
//  GameScene.swift
//  SpriteKitStudy
//
//  Created by SwiftMan on 12/6/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
  
  private var label : SKLabelNode?
  private var spinnyNode : SKShapeNode?
  
  override func didMove(to view: SKView) {
    self.anchorPoint = .zero
    
    let mySprite = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
    
    mySprite.position = CGPoint(x: 150, y: 150)
    
    self.addChild(mySprite)
    
    let demoAction = SKAction.scale(to: 4, duration: 5)
//    mySprite.run(demoAction)
    
    let demoAction2 = SKAction.rotate(byAngle: 5, duration: 5)
//    mySprite.run(demoAction2)
    
    let actionSequence = SKAction.sequence([demoAction, demoAction2])
    mySprite.run(actionSequence)
  }
  
  func touchDown(atPoint pos : CGPoint) {
    if let n = self.spinnyNode?.copy() as! SKShapeNode? {
      n.position = pos
      n.strokeColor = SKColor.green
      self.addChild(n)
    }
  }
  
  func touchMoved(toPoint pos : CGPoint) {
    if let n = self.spinnyNode?.copy() as! SKShapeNode? {
      n.position = pos
      n.strokeColor = SKColor.blue
      self.addChild(n)
    }
  }
  
  func touchUp(atPoint pos : CGPoint) {
    if let n = self.spinnyNode?.copy() as! SKShapeNode? {
      n.position = pos
      n.strokeColor = SKColor.red
      self.addChild(n)
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let label = self.label {
      label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
    }
    
    for t in touches { self.touchDown(atPoint: t.location(in: self)) }
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
  }
  
  
  override func update(_ currentTime: TimeInterval) {
    // Called before each frame is rendered
  }
}
