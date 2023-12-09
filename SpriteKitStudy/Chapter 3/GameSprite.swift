//
//  GameSprite.swift
//  SpriteKitStudy
//
//  Created by SwiftMan on 12/9/23.
//

import Foundation
import SpriteKit

protocol GameSprite {
  var textureAtlas: SKTextureAtlas { get set }
  var initialSize: CGSize { get set }
  func onTap()
}
