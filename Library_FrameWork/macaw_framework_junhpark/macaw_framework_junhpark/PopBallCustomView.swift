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
    
    let n = 1
    let speed = 20.0
    let r = 10.0
    let time = 30.0
    
    
    let ballColors = [
        Color(val: 0x1abc9c),
        Color(val: 0x2ecc71),
        Color(val: 0x3498db),
        Color(val: 0x9b59b6),
        Color(val: 0xf1c40f),
        Color(val: 0xe67e22),
        Color(val: 0xe67e22),
        Color(val: 0xe74c3c)
    ]
    
    required init?(coder aDecoder: NSCoder) {
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
    
    
    
    func prepareAnimation(figure: Float) {
        ballNodes.removeAll()
        
        var animations = [Animation]()
        
        let startPos = Transform.move(
            dx: Double(self.frame.width / 2) - r,
            dy: Double(self.frame.height)
        )
        
        var velocities = [Point]()
        var positions = [Point]()
        
        func posForTime(_ t: Double, index: Int) -> Point {
            
            let prevPos = positions[index]
            var velocity = velocities[index]
            
            var pos = prevPos.add(velocity)
            
            // Borders
            if pos.x < Double(self.frame.width) / -2.0 || pos.x > Double(self.frame.width) / 2.0 {
                velocity = Point(x: -1.0 * velocity.x, y: velocity.y)
                velocities[index] = velocity
                pos = prevPos.add(velocity)
            }
            
            if pos.y < Double(self.frame.height) / -1.0 || pos.y > Double(self.frame.height) / 1.0 {
                velocity = Point(x: velocity.x, y: -1.0 * velocity.y)
                velocities[index] = velocity
                pos = prevPos.add(velocity)
            }
            
            return pos
        }
        
        for i in 0 ... (n - 1) {
            // Node
            let circle = Circle(cx: r, cy: r, r: r)
            let shape = Shape(
                form: circle,
                fill: ballColors[Int(arc4random() % 7)]
            )
            
            let ballGroup = Group(contents: [shape])
            ballNodes.append(ballGroup)
            
            // Animation
            let velocity = Point(
                x: -0.5 * speed + speed * Double((arc4random() % 300) + 700) / 1000.0,
                y: -0.5 * speed + speed * Double((arc4random() % 300) + 700) / 1000.0)
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
        
        animation = animations.combine().autoreversed().onComplete {
            self.completeAnimation(figure: figure)
        }
        
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
