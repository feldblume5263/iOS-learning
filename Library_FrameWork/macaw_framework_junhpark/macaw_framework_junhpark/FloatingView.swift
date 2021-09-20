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
    var animation: Animation!
    
    var shapeColor: Int = 0x3EB489
    var shapeSpeed: Double = 0.3
    
    var shapeNodes = [Group]()

    
    required init?(coder aDecoder: NSCoder) {
        super.init(node: shapeNodes.group(), coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func startAnimation(size: Double, range: Double, centerX: CGFloat, centerY: CGFloat) {
        
        self.createConstraints(size: size, range: range, fromCenterX: centerX, fromCenterY: centerY)
        
        replayAnimation(size: size, range: range)
    }
    
    func replayAnimation(size: Double, range: Double) {
        
        makeAnimation(size: size, range: range, tag: 1)
        self.node = shapeNodes.group()
        animation = animations.combine().onComplete {
            self.makeAnimation(size: size, range: range, tag: 2)
            self.node = self.shapeNodes.group()
            self.animation = self.animations.combine().onComplete {
                self.makeAnimation(size: size, range: range, tag: 3)
                self.node = self.shapeNodes.group()
                self.animation = self.animations.combine().onComplete {
                    self.makeAnimation(size: size, range: range, tag: 4)
                    self.node = self.shapeNodes.group()
                    self.animation = self.animations.combine().onComplete {
                        
                        if self.animation.state() == AnimationState.paused {
                            self.replayAnimation(size: size, range: range)
                        }
                    }
                    self.animation.play()
                }
                self.animation.play()
            }
            self.animation.play()
        }
        self.animation.play()
    }
    
    func makeAnimation(size: Double, range: Double, tag: Int) {
        
        shapeNodes.removeAll()
        animations.removeAll()
        
        let screenSize: CGRect = self.frame
        let centerX = Double(screenSize.width / 2)
        let centerY = Double(screenSize.height / 2)
        
        let type = Easing.ease
        let fromShape: Shape
        let toPlace: Transform
        if tag == 1 {
            fromShape = Circle(cx: centerX, cy: centerY - range, r: size).fill(shapeColor)
            toPlace = fromShape.place.move(dx: 0, dy: range)
        } else if tag == 2 {
            fromShape = Circle(cx: centerX, cy: centerY, r: size).fill(shapeColor)
            toPlace = fromShape.place.move(dx: 0, dy: range)
        } else if tag == 3 {
            fromShape = Circle(cx: centerX, cy: centerY + range, r: size).fill(shapeColor)
            toPlace = fromShape.place.move(dx: 0, dy: range * -1)
        } else {
            fromShape = Circle(cx: centerX, cy: centerY, r: size).fill(shapeColor)
            toPlace = fromShape.place.move(dx: 0, dy: range * -1)
        }
        
        let toAnimation = fromShape.placeVar.animation(to: toPlace, during: shapeSpeed).easing(type)
        
        animations.append([toAnimation].sequence())
        shapeNodes.append(Group(contents: [fromShape]))
    }
    
    func createConstraints(size: Double, range: Double, fromCenterX: CGFloat, fromCenterY: CGFloat) {
        
        self.frame.size = CGSize(width: size * 2 + 10, height: range * 2 + size * 2 )
        self.center.x = superview!.center.x + fromCenterX
        self.center.y = superview!.center.y + fromCenterY
        self.backgroundColor = .clear
    }
    
    func setShapeColore(newColor: Int) {
        shapeColor = newColor
        
    }
}
