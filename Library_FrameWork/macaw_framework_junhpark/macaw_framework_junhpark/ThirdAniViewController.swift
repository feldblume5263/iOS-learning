//
//  ThirdAniViewController.swift
//  macaw_framework_junhpark
//
//  Created by Junhong Park on 2021/09/18.
//

import UIKit
import WaveAnimationView

class ThirdAniViewController: UIViewController {
    
    private var floatView1 = FloatingView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//    private var floatView2 = FloatingView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
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
        
        
        waveView = WaveAnimationView(frame: CGRect(x: view.center.x, y: view.center.y, width: view.frame.width , height: view.frame.height * 0.3), color: .purple)
        
        view.addSubview(waveView)
        createWaveViewConstraints()
        
        view.addSubview(floatView1)
//        view.addSubview(floatView2)
        floatView1.prepareAnimation(size: 30, range: 30, delay: 0, fromCenterX: 0, fromCenterY: 0)
//        floatView2.prepareAnimation(size: 30, range: 30, delay: 0, fromCenterX: 0, fromCenterY: 0)
//        floatView2.alpha = 0.0
        
        view.addSubview(colorButton)
        createColorButtonConstraints()
        colorButton.addTarget(self, action: #selector(colorButtonPressed), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        
        floatView1.animation.play()
//        floatView2.animation.play()
        
        waveView.startAnimation()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        waveView.stopAnimation()
        floatView1.animation.stop()
//        floatView2.animation.stop()
    }
    
    func createWaveViewConstraints() {
        
        waveView.frame.size = CGSize(width: view.frame.width, height: view.frame.height * 0.3)
        waveView.center = view.center
    }
    
    func createColorButtonConstraints() {
        
        colorButton.frame.size = CGSize(width: view.frame.width * 0.3, height: view.frame.height * 0.1)
        colorButton.center = CGPoint(x: view.frame.width / 2, y: view.frame.height * 0.8)
    }
    
    @objc func colorButtonPressed() {
        
        if colorIdx % 2 == 0 {
            floatView1.setShapeColore(newColor: 0x7FFFD4)
        }
        else {
            floatView1.setShapeColore(newColor: 0x3EB489)
        }
        colorIdx = colorIdx + 1
        
    }
}
