//
//  FourthAniViewController.swift
//  macaw_framework_junhpark
//
//  Created by Junhong Park on 2021/09/21.
//

import UIKit
import Macaw

class FourthAniViewController: UIViewController {

    
    private var shapeButton: UIButton = {
    
        let newButton = UIButton()
        newButton.setTitle("Shape", for: .normal)
        newButton.addTarget(self, action: #selector(shapeButtonPressed), for: .touchUpInside)
        newButton.backgroundColor = subColor
        newButton.setTitleColor(.brown, for: .normal)
        return newButton
    }()
    
    private var colorButton: UIButton = {
    
        let newButton = UIButton()
        newButton.setTitle("Color", for: .normal)
        newButton.addTarget(self, action: #selector(colorButtonPressed), for: .touchUpInside)
        newButton.backgroundColor = subColor
        newButton.setTitleColor(.brown, for: .normal)
        return newButton
    }()
    
    private var floatView1 = SvgTestView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private var floatView2 = SvgTestView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    let appleShape = try! SVGParser.parse(resource: "apple")
    let androidShape = try! SVGParser.parse (resource: "android2")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = mainColor
        view.addSubview(floatView1)
        view.addSubview(floatView2)
        
        floatView1.setAndPlayAnimation(shapeNode: appleShape, size: 60, range: 30, centerX: 0, centerY: 0)
        floatView2.setAndPlayAnimation(shapeNode: androidShape, size: 60, range: 30, centerX: 0, centerY: -25)
        floatView2.alpha = 0.0
        view.addSubview(shapeButton)
        view.addSubview(colorButton)
        
        shapeButton.frame.size = CGSize(width: 100, height: 50)
        shapeButton.center = CGPoint(x: view.frame.width * 0.5, y: view.frame.height * 0.88)
        shapeButton.layer.cornerRadius = 5.0
        shapeButton.layer.shadowColor = UIColor.gray.cgColor
        shapeButton.layer.shadowOpacity = 1.0
        shapeButton.layer.shadowOffset = CGSize.zero
        shapeButton.layer.shadowRadius = 6
        
        colorButton.frame.size = CGSize(width: 100, height: 50)
        colorButton.center = CGPoint(x: view.frame.width * 0.5, y: view.frame.height * 0.78)
        colorButton.layer.cornerRadius = 5.0
        colorButton.layer.shadowColor = UIColor.gray.cgColor
        colorButton.layer.shadowOpacity = 1.0
        colorButton.layer.shadowOffset = CGSize.zero
        colorButton.layer.shadowRadius = 6
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        floatView1.stopAnimation()
        floatView2.stopAnimation()
    }
    
    
    var shapeIdx = 0
    
    @objc func shapeButtonPressed() {
        
        if shapeIdx % 2 == 0 {
            floatView2.alpha = 1.0
            floatView1.alpha = 0.0
        } else if shapeIdx % 2 == 1 {
            floatView2.alpha = 0.0
            floatView1.alpha = 1.0
        }
        shapeIdx = shapeIdx + 1
    }
    
    var colorIdx = 0
    
    @objc func colorButtonPressed() {
        
        if colorIdx % 2 == 0 {
            floatView2.setShapeColor(newColor: 0xCFFFE5)
            floatView1.setShapeColor(newColor: 0xCFFFE5)
        } else if colorIdx % 2 == 1 {
            floatView2.setShapeColor(newColor: 0xE6bE8A)
            floatView1.setShapeColor(newColor: 0xE6bE8A)
        }
        colorIdx = colorIdx + 1
    }
}
