//
//  MinhaCena.swift
//  meuGame
//
//  Created by Gabriel Jacinto on 23/11/19.
//  Copyright © 2019 Gabriel Jacinto. All rights reserved.
//

import SpriteKit

class MinhaCena: SKScene {
    
    enum PlayerAnimationKey: String {
        case walking
        case energizing
    }

    var playerSpriteNode: SKSpriteNode?
    var toUpTextures: [SKTexture] = []
    var toDownTextures: [SKTexture] = []
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.black
        
        let texture = SKTexture(imageNamed: "player")
        let playerSpriteSheet = SpriteSheet(texture: texture, rows: 4, columns: 4, spacing: 0, margin: 0)

        for column in 0...3 {
            if let texture = playerSpriteSheet.textureForColumn(column: column, row: 2) {
                toUpTextures.append(texture)
            }
            
            if let texture = playerSpriteSheet.textureForColumn(column: column, row: 3) {
                toDownTextures.append(texture)
            }
        }

        playerSpriteNode = SKSpriteNode(texture: toDownTextures.first)
        playerSpriteNode?.position.x = self.frame.midX
        playerSpriteNode?.position.y = self.frame.midY

        if let check = playerSpriteNode {
            self.addChild(check)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: self) {
            let halfHeight = size.height * 0.5 // metade da altura
            
            if location.y > halfHeight {
                // acima da metada da alture
                
                playerSpriteNode?.removeAction(forKey: PlayerAnimationKey.walking.rawValue)
                
                let animateTextureAction = SKAction.animate(with: toUpTextures, timePerFrame: 0.1)
                let repeatAction = SKAction.repeatForever(animateTextureAction)
                
                playerSpriteNode?.run(repeatAction, withKey: PlayerAnimationKey.walking.rawValue)
                
            } else if location.y < halfHeight {
                // abaixo da metada da alture
                
                playerSpriteNode?.removeAction(forKey: PlayerAnimationKey.walking.rawValue)
                
                let animateTextureAction = SKAction.animate(with: toDownTextures, timePerFrame: 0.1)
                let repeatAction = SKAction.repeatForever(animateTextureAction)
                
                playerSpriteNode?.run(repeatAction, withKey: PlayerAnimationKey.walking.rawValue)
            }
        }
        
    }
}








        //        let bolinha:SKShapeNode = SKShapeNode(circleOfRadius:25)
        //        bolinha.fillColor = .red
        //        bolinha.strokeColor = .green
        //        bolinha.lineWidth = 3
        //        bolinha.position.x = 100
        //        bolinha.position.y = 100
        //        self.addChild(bolinha)
        //
        //        let retangulo:SKShapeNode = SKShapeNode(rectOf: CGSize(width: 100, height: 100))
        //        retangulo.fillColor = .blue
        //        bolinha.strokeColor = .green
        //        retangulo.lineWidth = 3
        //        retangulo.position.x = 200
        //        retangulo.position.y = 100
        //        self.addChild(retangulo)
        
//        let meuSprite: SKSpriteNode = SKSpriteNode(imageNamed: "megaman")
//        meuSprite.position.x = self.frame.midX
//        meuSprite.position.y = self.frame.midY
//        self.addChild(meuSprite)
//
//        let point = CGPoint(x: 300, y: 100.0)
//        let acaoMover: SKAction = SKAction.move(to: point, duration: 2.0)
//        let acaoFade: SKAction = SKAction.fadeOut(withDuration: 1.0)
//        let _: SKAction = SKAction.wait(forDuration: 2.0)
//        let _: SKAction = SKAction.removeFromParent()
//        let sequencia: SKAction = SKAction.sequence([acaoMover ,acaoFade])
//        meuSprite.run(sequencia)
//
//        let acaoVai = SKAction.moveBy(x: 100, y: 200, duration: 1.0)
//        let acaoVolta = SKAction.moveBy(x: -100, y: -200, duration: 1.0)
//        meuSprite.run(SKAction.repeatForever(SKAction.sequence([acaoVai, acaoVolta])))
        
