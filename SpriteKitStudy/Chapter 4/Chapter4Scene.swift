//
//  Chapter4Scene.swift
//  SpriteKitStudy
//
//  Created by SwiftMan on 12/21/23.
//

import SpriteKit
import GameplayKit
import CoreMotion

class Chapter4Scene: SKScene {
  
  let cam = SKCameraNode()
  
  let player = Player()
  
  let ground = Ground()
  
  let motionManager = CMMotionManager()
  
  override func didMove(to view: SKView) {
    self.anchorPoint = .zero
    
    self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
    
    self.camera = cam
    
    let bee2 = Bee()
    
    bee2.position = CGPoint(x: 325, y: 325)
    self.addChild(bee2)
    
    let bee3 = Bee()
    bee3.position = CGPoint(x: 200, y: 325)
    self.addChild(bee3)
    
    ground.position = CGPoint(x: -self.size.width * 2, y: 30)
    
    ground.size = CGSize(width: self.size.width * 6, height: 0)
    ground.createChildren()
    self.addChild(ground)
    
    player.position = CGPoint(x: 150, y: 250)
    self.addChild(player)
    
    self.motionManager.startAccelerometerUpdates()
  }
  
  override func update(_ currentTime: TimeInterval) {
    player.update()
    
    if let accelData = self.motionManager.accelerometerData {
      var forceAmount: CGFloat = 0
      var movement = CGVector()
      
      if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        let interfaceOrientation = windowScene.interfaceOrientation
        switch interfaceOrientation {
        case .unknown, .portrait, .portraitUpsideDown:
          forceAmount = 0
        case .landscapeLeft:
          forceAmount = 20000
        case .landscapeRight:
          forceAmount = -20000
        @unknown default:
          forceAmount = 0
        }
      }
      
      if accelData.acceleration.y > 0.15 {
        movement.dx = forceAmount
      } else if accelData.acceleration.y < -0.15 {
        movement.dx = -forceAmount
      }
      
      player.physicsBody?.applyForce(movement)
    }
  }
  
  override func didSimulatePhysics() {
    self.camera!.position = player.position
  }
}
