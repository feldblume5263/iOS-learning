//
//  FourthAniViewController.swift
//  macaw_framework_junhpark
//
//  Created by Junhong Park on 2021/09/21.
//

import UIKit
import Macaw

class FourthAniViewController: UIViewController {

    
    private var button: UIButton = {
    
        let newButton = UIButton()
        newButton.frame = CGRect(x: 200, y: 700, width: 100, height: 30)
        newButton.setTitle("Shape", for: .normal)
        newButton.addTarget(self, action: #selector(shapeButtonPressed), for: .touchUpInside)
        newButton.backgroundColor = .blue
        newButton.setTitleColor(.black, for: .normal)
        return newButton
    }()
    private var floatView1 = SvgTestView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    let appleShape = try! SVGParser.parse(resource: "apple")
    let androidShape = try! SVGParser.parse (resource: "android2")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = mainColor
        view.addSubview(floatView1)
        
        floatView1.setAndPlayAnimation(shapeNode: appleShape, size: 60, range: 70, centerX: 0, centerY: 0)
        view.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        floatView1.stopAnimation()
    }
    
    
    @objc func shapeButtonPressed() {
        
        floatView1.setShape(node: androidShape, size: 60, range: 30, centerX: 0, centerY: 0)
    }
    
}
