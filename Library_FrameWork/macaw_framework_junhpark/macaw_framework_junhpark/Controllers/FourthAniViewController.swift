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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = mainColor
        
        let svg = try! SVGParser.parse(resource: "apple")
        
        floatView1.setSVGtoShape(node: svg)
        
        view.addSubview(floatView1)

        floatView1.setAndPlayAnimation(width: 90, height: 100, range: 60, centerX: 0, centerY: 0)
        floatView1.backgroundColor = UIColor.gray
        
    }
    

    
    func replaceColors(node: Node) {
        if let group = node as? Group {
            for child in group.contents {
                replaceColors(node: child)
            }
        } else if let shape = node as? Shape {
            shape.fill = Color.blue
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        floatView1.animation.stop()
    }
    
    
    

}
