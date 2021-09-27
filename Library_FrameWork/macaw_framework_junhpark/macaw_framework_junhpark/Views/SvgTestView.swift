//
//  FloatingView.swift
//  macaw_framework_junhpark
//
//  Created by Junhong Park on 2021/09/18.
//

import UIKit
import Macaw

class SvgTestView: MacawView {
    
    private var animation: Animation!
    private var animations = [Animation]()
    
    private var shape: Shape!
    private var shapeColor: Int = 0xE6bE8A
    private var shapeSpeed: Double = 0.25
    
    private var shapeNodes = [Group]()
    private var shapeRange: Double = 1

    
    required init?(coder aDecoder: NSCoder) {
        super.init(node: shapeNodes.group(), coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setAndPlayAnimation(shapeNode: Node, size: Double, range: Double, centerX: CGFloat, centerY: CGFloat) {
        
        self.setShape(node: shapeNode, size: size, range: range, centerX: centerX, centerY: centerY)
        self.playOnRepeatAnimation(range: range)
    }
    
    func playOnRepeatAnimation(range: Double) {
        
        makeAnimation(range: shapeRange, tag: 1)
        self.node = shapeNodes.group()
        animation = animations.combine().onComplete {
            self.makeAnimation(range: self.shapeRange, tag: 2)
            self.node = self.shapeNodes.group()
            self.animation = self.animations.combine().onComplete {
                self.makeAnimation(range: self.shapeRange, tag: 3)
                self.node = self.shapeNodes.group()
                self.animation = self.animations.combine().onComplete {
                    self.makeAnimation(range: self.shapeRange, tag: 4)
                    self.node = self.shapeNodes.group()
                    self.animation = self.animations.combine().onComplete {

                        if self.animation.state() == AnimationState.paused {
                            self.playOnRepeatAnimation(range: self.shapeRange)
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
    
    func playAnimation() {
        self.animation.play()
    }
    
    func stopAnimation() {
        self.animation.stop()
    }
    
    private func makeAnimation(range: Double, tag: Int) {
        
        shapeNodes.removeAll()
        animations.removeAll()
        
        let type = Easing.ease
        let fromShape: Shape
        let toPlace: Transform
        
        shape.fill = Color(shapeColor)
        
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
    
    func setShapeColor(newColor: Int) {
        shapeColor = newColor
    }
    
    func replaceColor(node: Node) {
        if let group = node as? Group {
            for child in group.contents {
                replaceColor(node: child)
            }
        } else if let shape = node as? Shape {
            shape.fill = Color(shapeColor)
        }
    }
    
    func setShape(node: Node, size: Double, range: Double, centerX: CGFloat, centerY: CGFloat) {
        
        if let group = node as? Group {
            for child in group.contents {
                setShape(node: child, size: size, range: range, centerX: centerX, centerY: centerY)
            }
        } else if let shape = node as? Shape {
            
            var ratio: Double
            
            self.shape = shape
            ratio = size / self.shape.form.bounds().w
            
            self.shapeRange = range / ratio
            print(self.shapeRange)

            self.shape.place = .scale(ratio, ratio).move(dx: -1 * shape.form.bounds().x, dy: -1 * shape.form.bounds().y)

            setBackgroundView(bounds: shape.form.bounds(),
                              range: shapeRange,
                              ratio: ratio,
                              fromCenterX: centerX,
                              fromCenterY: centerY)
        }
    }
    
    private func setBackgroundView(bounds: Rect, range: Double, ratio: Double, fromCenterX: CGFloat, fromCenterY: CGFloat) {
        
        self.frame.size = CGSize(width: bounds.w * ratio, height: range * 2 + bounds.h * ratio * 2)
        self.center.x = superview!.center.x + fromCenterX
        self.center.y = superview!.center.y + fromCenterY
        self.backgroundColor = .clear
    }
    
    
}
