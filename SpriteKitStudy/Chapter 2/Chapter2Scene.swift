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
    
    let bee = SKSpriteNode(imageNamed: "bee")
    bee.size = CGSize(width: 100, height: 100)
    bee.position = CGPoint(x: 250, y: 250)
    self.addChild(bee)
  }
  
//  func touchDown(atPoint pos : CGPoint) {
//    if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//      n.position = pos
//      n.strokeColor = SKColor.green
//      self.addChild(n)
//    }
//  }
//  
//  func touchMoved(toPoint pos : CGPoint) {
//    if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//      n.position = pos
//      n.strokeColor = SKColor.blue
//      self.addChild(n)
//    }
//  }
//  
//  func touchUp(atPoint pos : CGPoint) {
//    if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//      n.position = pos
//      n.strokeColor = SKColor.red
//      self.addChild(n)
//    }
//  }
//  
//  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    if let label = self.label {
//      label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//    }
//    
//    for t in touches { self.touchDown(atPoint: t.location(in: self)) }
//  }
//  
//  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//    for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//  }
//  
//  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//  }
//  
//  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//    for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//  }
//  
//  
//  override func update(_ currentTime: TimeInterval) {
//    // Called before each frame is rendered
//  }
}
