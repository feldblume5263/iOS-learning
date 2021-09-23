//
//  ViewController.swift
//  macaw_framework_junhpark
//
//  Created by Junhong Park on 2021/09/15.
//

import UIKit
import Macaw

class MainViewController: UIViewController {
    
    
    private var greetingView: UIView = {
        
        let newView = UIView()
        
        newView.backgroundColor = subColor
        newView.layer.cornerRadius = 10
        
        newView.layer.shadowColor = UIColor.gray.cgColor
        newView.layer.shadowOpacity = 1.0
        newView.layer.shadowOffset = CGSize.zero
        newView.layer.shadowRadius = 6
        
        return newView
    }()
    
    private var greetingLabel: UILabel = {
        let newLabel = UILabel()
        
        newLabel.text = "Welcome to Junhpark's iOS :)"
        newLabel.textColor = .brown
        newLabel.textAlignment = .center
        newLabel.font = UIFont.systemFont(ofSize: 15)
        
        return newLabel
    }()
    
    
    private var startButton: UIButton = {
        
        let newButton = UIButton()
        
        newButton.backgroundColor = subColor
        newButton.setTitle("Start", for: .normal)
        newButton.setTitleColor(.brown, for: .normal)
        
        newButton.layer.cornerRadius = 15
        newButton.layer.shadowColor = UIColor.gray.cgColor
        newButton.layer.shadowOpacity = 1.0
        newButton.layer.shadowOffset = CGSize.zero
        newButton.layer.shadowRadius = 6
        
        newButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        
        return newButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = mainColor
        
        createMainViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    func createMainViews() {
        
        view.addSubview(greetingView)
        view.addSubview(greetingLabel)
        view.addSubview(startButton)
        
        createGreetingViewConstraint()
        createGreetgingLabelConstraint()
        createStartButtonConstraint()
        
    }
    
    func removeMainViews() {
        
        greetingView.removeFromSuperview()
        greetingLabel.removeFromSuperview()
        startButton.removeFromSuperview()
    }
    
    func createStartButtonConstraint() {
        
        startButton.frame.size = CGSize(width: view.frame.width * 0.3, height: view.frame.height * 0.05)
        
        startButton.frame.origin.x = (view.frame.width / 2) - (startButton.frame.width / 2)
        startButton.frame.origin.y = (view.frame.height / 1.5) - (startButton.frame.height / 2)
    }
    
    
    func createGreetgingLabelConstraint() {
        
        let viewWidth = view.frame.width
        let viewHeight = view.frame.height
        
        greetingLabel.frame.size = CGSize(width: viewWidth * 0.5, height: viewHeight * 0.1)
        
        greetingLabel.frame.origin.x = (viewWidth / 2) - (greetingLabel.frame.width / 2)
        greetingLabel.frame.origin.y = (viewHeight / 3.0) - (greetingLabel.frame.height / 2)
    }
    
    func createGreetingViewConstraint() {
        
        let viewWidth = view.frame.width
        let viewHeight = view.frame.height
        
        greetingView.frame.size = CGSize(width: viewWidth * 0.7, height: viewHeight * 0.1)
        
        greetingView.frame.origin.x = (viewWidth / 2) - (greetingView.frame.width / 2)
        greetingView.frame.origin.y = (viewHeight / 3.0) - (greetingView.frame.height / 2)
    }
    
    
    @objc func startButtonPressed(sender: UIButton!) {
        
        let viewControllerName = self.storyboard?.instantiateViewController(withIdentifier: "thirdAniVC")
        
        if let thirdAniView = viewControllerName {
            self.navigationController?.pushViewController(thirdAniView, animated: true)
        }
        
    }
}

