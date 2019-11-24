//
//  SpriteSheet.swift
//  meuGame
//
//  Created by Gabriel Jacinto on 23/11/19.
//  Copyright © 2019 Gabriel Jacinto. All rights reserved.
//

import SpriteKit

class SpriteSheet {
    let texture: SKTexture
    let rows: Int
    let columns: Int
    var margin: CGFloat = 0
    var spacing: CGFloat = 0
    
    var frameSize: CGSize {
        let size = texture.size()
        let space = margin * 2 + spacing
        let width = (size.width - (space * CGFloat(columns-1))) / CGFloat(columns)
        let height = (size.height - (space * CGFloat(rows-1))) / CGFloat(rows)
        
        return CGSize(width: width, height: height)
    }
    
    init(texture: SKTexture, rows: Int, columns: Int, spacing: CGFloat, margin: CGFloat) {
        self.texture = texture
        self.rows = rows
        self.columns = columns
        self.spacing = spacing
        self.margin = margin
        
    }
    
    convenience init(texture: SKTexture, rows: Int, columns: Int) {
        self.init(texture: texture, rows: rows, columns: columns, spacing: 0, margin: 0)
    }
    
    func textureForColumn(column: Int, row: Int) -> SKTexture? {
        if !(0...self.rows ~= row && 0...self.columns ~= column) {
            //location is out of bounds
            return nil
        }
        
        var textureRect=CGRect(x: self.margin+CGFloat(column)*(self.frameSize.width+self.spacing)-self.spacing,
                               y: self.margin+CGFloat(row)*(self.frameSize.height+self.spacing)-self.spacing,
                               width: self.frameSize.width,
                               height: self.frameSize.height)
        
        textureRect=CGRect(x: textureRect.origin.x/self.texture.size().width, y: textureRect.origin.y/self.texture.size().height,
                           width: textureRect.size.width/self.texture.size().width, height: textureRect.size.height/self.texture.size().height)
        return SKTexture(rect: textureRect, in: self.texture)
    }
    
}
