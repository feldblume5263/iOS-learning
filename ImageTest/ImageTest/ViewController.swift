//
//  ViewController.swift
//  ImageTest
//
//  Created by Junhong Park on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var testImage: UIImageView!
    @IBOutlet weak var testButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTestImage()
        setTestButton()
    }
    
    func setTestButton() {
        
        testButton.backgroundColor = .clear
        testButton.setTitle("___", for: .normal)
        testButton.addTarget(self, action: #selector(changeImageColor), for: .touchUpInside)
    }
    
    func setTestImage() {
        
        testImage.backgroundColor = .clear
        testImage.image = UIImage(named: "circle2")?.withRenderingMode(.alwaysTemplate)
        testImage.tintColor = .blue
    }
    
    @objc func changeImageColor() {
        
        if testImage.tintColor == .blue {
            testImage.tintColor = .black
        } else {
            testImage.tintColor = .blue
        }
    }
}

