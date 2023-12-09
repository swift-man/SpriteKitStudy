//
//  Chapter2ViewController.swift
//  SpriteKitStudy
//
//  Created by SwiftMan on 12/9/23.
//

import Foundation
import SpriteKit
import GameplayKit

class Chapter2ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    if let view = self.view as! SKView? {
      if let scene = SKScene(fileNamed: "Chapter2Scene") {
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        scene.size = view.bounds.size
        
        // Present the scene
        view.presentScene(scene)
      }
      
      view.ignoresSiblingOrder = true
      
      view.showsFPS = true
      view.showsNodeCount = true
    }
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if UIDevice.current.userInterfaceIdiom == .phone {
      return .landscape
    } else {
      return .all
    }
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
}
