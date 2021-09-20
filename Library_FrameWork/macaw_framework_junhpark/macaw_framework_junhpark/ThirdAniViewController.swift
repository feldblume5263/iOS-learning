//
//  ThirdAniViewController.swift
//  macaw_framework_junhpark
//
//  Created by Junhong Park on 2021/09/18.
//

import UIKit
import WaveAnimationView

class ThirdAniViewController: UIViewController {
    
    private var observer: NSObjectProtocol?
    
    private var floatView1 = FloatingView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private var floatView2 = FloatingView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private var floatView3 = FloatingView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    private var waveView: WaveAnimationView!
    
    private var colorIdx = 0
    
    private var colorButton: UIButton = {
        
        let newButton = UIButton()
        newButton.setTitle("Color", for: .normal)
        return newButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = mainColor
        
        
        waveView = WaveAnimationView(frame: CGRect(x: 0, y: view.center.y - view.frame.height * 0.2, width: view.frame.width , height: view.frame.height * 0.7), color: .purple)
        
        view.addSubview(waveView)
        
        view.addSubview(floatView1)
        view.addSubview(floatView2)
        view.addSubview(floatView3)
                
        view.addSubview(colorButton)
        createColorButtonConstraints()
        colorButton.addTarget(self, action: #selector(colorButtonPressed), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true

        waveView.startAnimation()
        
        floatView1.startAnimation(size: 30, range: 8, centerX: 0, centerY: 140)
        floatView2.startAnimation(size: 20, range: 10, centerX: 150, centerY: 128)
        floatView3.startAnimation(size: 25, range: 6, centerX: -120, centerY: 130)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        waveView.stopAnimation()
        floatView1.animation.stop()
        floatView2.animation.stop()
        floatView3.animation.stop()
    }
    
    func createColorButtonConstraints() {
        
        colorButton.frame.size = CGSize(width: view.frame.width * 0.3, height: view.frame.height * 0.1)
        colorButton.center = CGPoint(x: view.frame.width / 2, y: view.frame.height * 0.8)
    }
    
    @objc func colorButtonPressed() {
        
        print(floatView1.animation.state())
        if colorIdx % 2 == 0 {
            floatView1.setShapeColore(newColor: 0x7FFFD4)
            floatView2.setShapeColore(newColor: 0x7FFFD4)
            floatView3.setShapeColore(newColor: 0x7FFFD4)
        }
        else {
            floatView1.setShapeColore(newColor: 0x3EB489)
            floatView2.setShapeColore(newColor: 0x3EB489)
            floatView3.setShapeColore(newColor: 0x3EB489)
        }
        colorIdx = colorIdx + 1
        if (colorIdx == 10) {
            colorIdx = 0
        }
        
    }
}
