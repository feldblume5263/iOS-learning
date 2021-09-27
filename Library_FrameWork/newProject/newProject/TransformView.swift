//
//  TransformView.swift
//  newProject
//
//  Created by Junhong Park on 2021/09/27.
//

import UIKit
import Macaw

class TransformView: MacawView {
    
    var rootGroup: Group!
    var animation: Animation!
    
    func firstfunc() {
    
        animation = makeAnimation()
        
        animation.autoreversed().cycle().play()
        self.node = rootGroup
    }
    
    private func makeAnimation() -> Animation {
        
        self.node = Group()
        
        let testGroup = try! SVGParser.parse(path: "test")  as! Group
        testGroup.place = .scale(sx: 0.2, sy: 0.2)
        let apple = testGroup.nodeBy(tag: "apple")!
        let android = testGroup.nodeBy(tag: "android")!
        
        rootGroup = [android].group()
        return rootGroup.contentsVar.animation(to: [apple], during: 3.0)
    }
}
