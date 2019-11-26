//
//  MinhaCena.swift
//  meuGame
//
//  Created by Gabriel Jacinto on 23/11/19.
//  Copyright © 2019 Gabriel Jacinto. All rights reserved.
//

import SpriteKit

class MinhaCena: SKScene {
    
    let retangulo = SKShapeNode(rectOf: CGSize(width: 100, height: 100))
    let bolinha = SKShapeNode(circleOfRadius: 25)
    let particula = SKEmitterNode(fileNamed: "minhaParticula.sks")
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.white
        
        retangulo.fillColor = .blue
        retangulo.strokeColor = .green
        retangulo.lineWidth = 3
        retangulo.position = CGPoint(x: 200, y: 300)
        self.addChild(retangulo)
        
        retangulo.physicsBody = SKPhysicsBody(rectangleOf: retangulo.frame.size)
        retangulo.physicsBody?.isDynamic = true
        retangulo.physicsBody?.allowsRotation = true
        
        let ret = CGRect(x: 0, y: 0, width: frame.width - 20, height: 10)
        let chao = SKShapeNode(rect: ret)
        chao.fillColor = .yellow
        let centerChao = CGPoint(x: (frame.width - 20) / 2, y: 5)
        chao.physicsBody = SKPhysicsBody(rectangleOf: chao.frame.size, center: centerChao)
        chao.physicsBody?.isDynamic = false
        chao.position.x = 10
        chao.position.y = 20
        addChild(chao)
        
        bolinha.fillColor = .red
        bolinha.strokeColor = .green
        bolinha.lineWidth = 3
        bolinha.position = CGPoint(x: 100, y: 300)
        self.addChild(bolinha)
        
        bolinha.physicsBody = SKPhysicsBody(circleOfRadius: bolinha.frame.size.width / 2)
        bolinha.physicsBody?.isDynamic = true
        bolinha.physicsBody?.allowsRotation = true
        
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.friction = 0
        self.physicsBody = borderBody
        
        if let check = particula {
            addChild(check)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        bolinha.physicsBody?.velocity = CGVector.zero
        bolinha.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 100))
        
        retangulo.physicsBody?.velocity = CGVector.zero
        retangulo.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 500))
        
        for touch in (touches) {
            let location = touch.location(in: self)
            print("PosX: \(location.x) PosY: \(location.y)")
            criaParticulasPenas(CGPoint(x: location.x, y: location.y))
        }
    }
    
    override func update(_ currenTime: TimeInterval) {
    }
    
    override func didSimulatePhysics() {
        particula?.position = bolinha.position
    }
    
    func criaParticulasPenas(_ p:CGPoint) {
        let peninha: SKTexture = SKTexture(imageNamed: "pena")
        let minhaParticula: SKEmitterNode = SKEmitterNode()
        minhaParticula.position = CGPoint(x: p.x, y: p.y)
        minhaParticula.particleBirthRate = 100
        minhaParticula.numParticlesToEmit = 7
        minhaParticula.particleLifetime = 1.3
        minhaParticula.particleTexture?.filteringMode = .nearest
        minhaParticula.xAcceleration = 0
        minhaParticula.yAcceleration = 0
        minhaParticula.particleSpeed = 100
        minhaParticula.particleSpeedRange = 200
        minhaParticula.particleRotationSpeed = -10
        minhaParticula.particleRotationRange = 4
        minhaParticula.emissionAngle = CGFloat(Double.pi * 2)
        minhaParticula.emissionAngleRange = CGFloat(Double.pi * 2)
        minhaParticula.particleColorAlphaSpeed = 0.1
        minhaParticula.particleRotationRange = 1
        minhaParticula.particleAlphaSequence = SKKeyframeSequence(keyframeValues: [1,0], times: [0,1])
        minhaParticula.particleScaleSequence = SKKeyframeSequence(keyframeValues: [3,0.5], times: [0,1])
        self.addChild(minhaParticula)
        minhaParticula.run(SKAction.sequence([SKAction.wait(forDuration: 2), SKAction.removeFromParent()]))
    }
}

