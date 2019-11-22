//
//  MeuJogoViewController.swift
//  meuGame
//
//  Created by Gabriel Jacinto on 22/11/19.
//  Copyright © 2019 Gabriel Jacinto. All rights reserved.
//

import UIKit
import SpriteKit

class MeuJogoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            if let cena = SKScene(fileNamed: "MeuJogo.sks") {
                cena.scaleMode = .aspectFill
                view.presentScene(cena)
            }
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsPhysics = true
            view.showsNodeCount = true
        }
    }
}
