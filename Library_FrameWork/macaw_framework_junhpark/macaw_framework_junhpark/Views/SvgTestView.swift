//
//  FloatingView.swift
//  macaw_framework_junhpark
//
//  Created by Junhong Park on 2021/09/18.
//

import UIKit
import Macaw

class SvgTestView: MacawView {
    
    var animations = [Animation]()
    var animation: Animation!
    
    var shapeColor: Int = 0x3EB489
    var shapeSpeed: Double = 0.25
    
    var shapeNodes = [Group]()
    
    var shape: Shape!

    
    required init?(coder aDecoder: NSCoder) {
        super.init(node: shapeNodes.group(), coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setAndPlayAnimation(width: Double, height: Double, range: Double, centerX: CGFloat, centerY: CGFloat) {
        
        self.createConstraints(width: width, height: height, range: range, fromCenterX: centerX, fromCenterY: centerY)
        playOnRepeatAnimation(width: width, range: range)
    }
    
    func playOnRepeatAnimation(width: Double, range: Double) {
        
        makeAnimation(width: width, range: range, tag: 1)
        self.node = shapeNodes.group()
        animation = animations.combine().onComplete {
            self.makeAnimation(width: width, range: range, tag: 2)
            self.node = self.shapeNodes.group()
            self.animation = self.animations.combine().onComplete {
                self.makeAnimation(width: width, range: range, tag: 3)
                self.node = self.shapeNodes.group()
                self.animation = self.animations.combine().onComplete {
                    self.makeAnimation(width: width, range: range, tag: 4)
                    self.node = self.shapeNodes.group()
                    self.animation = self.animations.combine().onComplete {
                        
                        if self.animation.state() == AnimationState.paused {
                            self.playOnRepeatAnimation(width: width, range: range)
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
    
    func makeAnimation(width: Double, range: Double, tag: Int) {
        
        shapeNodes.removeAll()
        animations.removeAll()
        
        let type = Easing.ease
        let fromShape: Shape
        let toPlace: Transform
        
        if tag == 1 {
            fromShape = self.shape
            toPlace = fromShape.place.move(dx: 0, dy: range)
        } else if tag == 2 {
            fromShape = self.shape
            toPlace = fromShape.place.move(dx: 0, dy: range)
        } else if tag == 3 {
            fromShape = self.shape
            toPlace = fromShape.place.move(dx: 0, dy: range * -1)
        } else {
            fromShape = self.shape
            toPlace = fromShape.place.move(dx: 0, dy: range * -1)
        }
        
        let toAnimation = fromShape.placeVar.animation(to: toPlace, during: shapeSpeed).easing(type)
        
        animations.append([toAnimation].sequence())
        shapeNodes.append(Group(contents: [fromShape]))
    }
    
    func createConstraints(width: Double, height: Double, range: Double, fromCenterX: CGFloat, fromCenterY: CGFloat) {
        
        self.frame.size = CGSize(width: width, height: range * 2 + height)
        self.center.x = superview!.center.x + fromCenterX
        self.center.y = superview!.center.y + fromCenterY
        self.backgroundColor = .clear
    }
    
    func setShapeColore(newColor: Int) {
        shapeColor = newColor
    }
    
    func setSVGtoShape(node: Node) {
        
        if let group = node as? Group {
            for child in group.contents {
                setSVGtoShape(node: child)
            }
        } else if let shape = node as? Shape {
            self.setShape(newShape: shape)
        }
    }
    
    func setShape(newShape: Shape) {
        self.shape = newShape
    }
    
}
