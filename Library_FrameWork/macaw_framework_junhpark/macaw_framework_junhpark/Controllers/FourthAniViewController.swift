//
//  FourthAniViewController.swift
//  macaw_framework_junhpark
//
//  Created by Junhong Park on 2021/09/21.
//

import UIKit
import Macaw

class FourthAniViewController: UIViewController {

    private var floatView1 = SvgTestView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    let appleShape = try! SVGParser.parse(resource: "apple")
    let androidShape = try! SVGParser.parse (resource: "android")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = mainColor
        view.addSubview(floatView1)
        
        let androidView = SVGView(node: androidShape, frame: CGRect(x: 100, y: 100, width: 300, height: 300))

        floatView1.setAndPlayAnimation(shapeNode: androidShape, size: 40, range: 50, centerX: 0, centerY: 0)
        
        androidView.backgroundColor = .gray
        view.addSubview(androidView)
        
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
    
    
    

}
