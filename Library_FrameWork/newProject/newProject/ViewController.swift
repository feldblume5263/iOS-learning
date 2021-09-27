//
//  ViewController.swift
//  newProject
//
//  Created by Junhong Park on 2021/09/27.
//

import UIKit
import Macaw

class ViewController: UIViewController {

    var transformView = TransformView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(transformView)
        transformView.backgroundColor = .gray
        transformView.center = CGPoint(x: view.center.x, y: view.center.y)
        transformView.frame.size = CGSize(width: 300, height: 100)
        transformView.firstfunc()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        transformView.animation.stop()
    }

}

