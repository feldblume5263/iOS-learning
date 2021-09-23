//
//  PopBallCustomView.swift
//  macaw_framework_junhpark
//
//  Created by Junhong Park on 2021/09/16.
//

import UIKit
import Macaw

class PopBallCustomView: MacawView {
    
    var animation: Animation?
    var ballNodes = [Group]()
    var onComplete: (() -> ()) = {}
    var shape: Int!
    
    let n = 5
    let speed = 35.0
    let r = 20.0
    let time = 30.0
    
    
    let ballColors = [
        Color(val: 0xffffff)
    ]
    
    required init?(coder aDecoder: NSCoder) {
        print("1")
        super.init(node: Group(), coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func startAnimation() {
        if let animation = self.animation {
            animation.play()
        }
    }
    
    func setShape(shape: Int) {
        
        self.shape = shape
    }
    
    func prepareAnimation(figure: Float) {
        ballNodes.removeAll()
        
        var animations = [Animation]()
        
        let startPos = Transform.move(
            dx: Double(self.bounds.width / 2) -  2 * r,
            dy: Double(self.bounds.height)
        )
        
        var velocities = [Point]()
        var positions = [Point]()
        
        func posForTime(_ t: Double, index: Int) -> Point {
            
            let prevPos = positions[index]
            var velocity = velocities[index]
            
            var pos = prevPos.add(velocity)
            
            // Borders
            if pos.x + 2 * r < Double(self.bounds.width) / -2.0 || pos.x + 2 * r > Double(self.bounds.width) / 2.0 {
                velocity = Point(x: -1.0 * velocity.x, y: velocity.y)
                velocities[index] = velocity
                pos = prevPos.add(velocity)
            }
            
            if pos.y + 2 * r < Double(self.bounds.height) / -2.0 || pos.y + 2 * r > Double(self.bounds.height) / 2.0 {
                velocity = Point(x: velocity.x, y: -1.0 * velocity.y)
                velocities[index] = velocity
                pos = prevPos.add(velocity)
            }
            
            return pos
        }
        
        let shapes : [Shape] = [Shape(form: Circle(cx: r, cy: r, r: r), fill: ballColors[0]),
                                Shape(form: Rect(2 * r, 2 * r, 2 * r, 2 * r), fill: ballColors[0]),
                                Shape(form: Circle(cx: r, cy: r, r: r), fill: ballColors[0])]
        
        
        for i in 0 ... (n - 1) {
            // Node

            
            let ballGroup = Group(contents: [shapes[shape]])
            ballNodes.append(ballGroup)
            
            // Animation
            let velocity = Point(
                x: -0.5 * speed + speed * Double((arc4random() % 300) + 500) / 1000.0,
                y: -0.5 * speed + speed * Double((arc4random() % 300) + 500) / 1000.0)
            velocities.append(velocity)
            positions.append(Point(x: 0.0, y: 0.0))
            
            let anim = ballGroup.placeVar.animation({ (t) -> Transform in
                let pos = posForTime(t, index: i)
                positions[i] = pos
                return Transform().move(
                    dx: pos.x,
                    dy: pos.y)
            }, during: time)
            
            animations.append([
                anim,
                ballGroup.opacityVar.animation((0.9 >> 1.0).t(time))
            ].combine())
        }
        
        animation = animations.combine().cycle().autoreversed()
        
        let node = Group(contents: ballNodes)
        node.place = Transform().move(dx: startPos.dx, dy: startPos.dy)
        self.node = node
    }
    
    
    
    func resetAnimation(figure: Float) {
        
        self.animation?.stop()
        completeAnimation(figure: figure)
    }
    
    
    func completeAnimation(figure: Float) {
        self.node = Group()
        self.prepareAnimation(figure: figure)
        self.onComplete()
    }
    
}
