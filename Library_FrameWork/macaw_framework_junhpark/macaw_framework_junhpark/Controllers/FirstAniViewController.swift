//
//  firstAniViewController.swift
//  macaw_framework_junhpark
//
//  Created by Junhong Park on 2021/09/15.
//

import UIKit
import Macaw



class FirstAniViewController: UIViewController {

    let popBallView = PopBallView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

    private var startPopButton: UIButton = {
       
        let newButton = UIButton()
        return newButton
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = mainColor
    
        let nextButton = UIBarButtonItem(title: "next", style: .done, target: self, action: #selector(nextButtonPressed))
        self.navigationItem.rightBarButtonItem = nextButton
        
        view.addSubview(popBallView)
        createPopBallViewConstraint()
        view.addSubview(startPopButton)
        createActionButtonConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        popBallView.onComplete = {
            self.startPopButton.isEnabled = true
        }
        
        popBallView.prepareAnimation()
        
        startPopButton.addTarget(self, action: #selector(startPopButtonPressed), for: .touchUpInside)
    }
    
    @objc func startPopButtonPressed() {
        
        popBallView.startAnimation()
        startPopButton.isEnabled = false
    }
    
    func createPopBallViewConstraint() {
        
        popBallView.frame.size = CGSize(width: 380, height: 600)
        popBallView.center = CGPoint(x: view.frame.width * 0.5, y: view.frame.height * 0.45)
        popBallView.backgroundColor = subColor
        popBallView.layer.cornerRadius = 10
        
        popBallView.layer.shadowColor = UIColor.gray.cgColor
        popBallView.layer.shadowOpacity = 1.0
        popBallView.layer.shadowOffset = CGSize.zero
        popBallView.layer.shadowRadius = 6
    }
    
    func createActionButtonConstraint() {
        
        startPopButton.frame.size = CGSize(width: 100, height: 50)
        startPopButton.center = CGPoint(x: view.frame.width * 0.5, y: view.frame.height * 0.88)
        startPopButton.backgroundColor = subColor
        startPopButton.setTitle("Pop", for: .normal)
        startPopButton.setTitleColor(.brown, for: .normal)
        startPopButton.setTitleColor(.white, for: .disabled)
        startPopButton.layer.cornerRadius = 5
        
        startPopButton.layer.shadowColor = UIColor.gray.cgColor
        startPopButton.layer.shadowOpacity = 1.0
        startPopButton.layer.shadowOffset = CGSize.zero
        startPopButton.layer.shadowRadius = 6
    }
    
    @objc func nextButtonPressed() {
        
        let viewControllerName = self.storyboard?.instantiateViewController(withIdentifier: "secondAniVC")
        
        if let secondAniView = viewControllerName {
            self.navigationController?.pushViewController(secondAniView, animated: true)
        }
    }
}
