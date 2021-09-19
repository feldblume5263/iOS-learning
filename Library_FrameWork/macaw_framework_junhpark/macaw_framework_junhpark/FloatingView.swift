//
//  FloatingView.swift
//  macaw_framework_junhpark
//
//  Created by Junhong Park on 2021/09/18.
//

import UIKit
import Macaw

class FloatingView: MacawView {
    
    var animations = [Animation]()
    var circlesNodes = [Group]()
    var animation: Animation!
    
    var shapeColor: Int = 0x3EB489
    
    required init?(coder aDecoder: NSCoder) {
        super.init(node: circlesNodes.group(), coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func prepareAnimation(size: Double, range: Double, delay: Double, fromCenterX: CGFloat, fromCenterY: CGFloat) {
        
        self.createFloatViewConstraints(size: size, range: range, fromCenterX: fromCenterX, fromCenterY: fromCenterY)
        
        makeAnimation(size: size, range: range)
        self.node = circlesNodes.group()
    
        animation = animations.combine().cycle().delay(delay).onComplete {
            
            self.replayWithNewAnimation(size: size, range: range)
        }
    }
    
    
    func replayWithNewAnimation(size: Double, range: Double) {
        
        makeAnimation(size: size, range: range)
        self.node = self.circlesNodes.group()

        self.animation = self.animations.combine()
    }
    
    func makeAnimation(size: Double, range: Double) {
        
        animations.removeAll()
        circlesNodes.removeAll()
        animations.removeAll()
        
        let screenSize: CGRect = self.frame
        let centerX = Double(screenSize.width / 2)
        let centerY = Double(screenSize.height / 2)
        
        let type = Easing.easeIn
        
        let fromCircle = Circle(cx: centerX, cy: centerY - range, r: size).fill(shapeColor)
        let toPlace = fromCircle.place.move(dx: 0, dy: range * 2)
        
        let toAnimation = fromCircle.placeVar.animation(to: toPlace).easing(type)
        
        animations.append([toAnimation.autoreversed()].sequence())
        circlesNodes.append(Group(contents: [fromCircle]))
    }
    
    func createFloatViewConstraints(size: Double, range: Double, fromCenterX: CGFloat, fromCenterY: CGFloat) {
        
        self.frame.size = CGSize(width: size * 2 + 10, height: range * 2 + size * 2 )
        self.center.x = superview!.center.x + fromCenterX
        self.center.y = superview!.center.y + fromCenterY
        self.backgroundColor = .clear
    }
    
    func setShapeColore(newColor: Int) {
        shapeColor = newColor
        
    }
}
