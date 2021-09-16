//
//  SecondAniViewController.swift
//  macaw_framework_junhpark
//
//  Created by Junhong Park on 2021/09/16.
//

import UIKit

class SecondAniViewController: UIViewController {

    private var userFigure: Float = 50.0
    
    let popBallView = PopBallCustomView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

    private var minusButton: UIButton = {
       
        let newButton = UIButton()
        
        return newButton
    }()
    
    private var plusButton: UIButton = {
       
        let newButton = UIButton()
        
        return newButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = mainColor
        
        view.addSubview(popBallView)
        createPopBallViewConstraint()
        view.addSubview(minusButton)
        createMinusButtonConstraint()
        view.addSubview(plusButton)
        createPlusButtonConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        popBallView.onComplete = {
            // 끝나고 할일을 정의!!
            self.minusButton.isEnabled = true
        }
        
        popBallView.prepareAnimation(figure: 30)
        popBallView.startAnimation()
        
        minusButton.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
    }
    
    @objc func minusButtonPressed() {
        
        if (userFigure >= 10) {
            userFigure = userFigure - 10
        }

        popBallView.resetAnimation(figure: userFigure)
        popBallView.startAnimation()
    }
    
    func createPopBallViewConstraint() {
        
        popBallView.frame.size = CGSize(width: 380, height: 100)
        popBallView.center = CGPoint(x: view.frame.width * 0.5, y: view.frame.height * 0.3)
        popBallView.backgroundColor = .clear
        popBallView.layer.cornerRadius = 10
        
        popBallView.layer.shadowColor = UIColor.gray.cgColor
        popBallView.layer.shadowOpacity = 1.0
        popBallView.layer.shadowOffset = CGSize.zero
        popBallView.layer.shadowRadius = 6
    }
    
    func createMinusButtonConstraint() {
        
        minusButton.frame.size = CGSize(width: 100, height: 50)
        minusButton.center = CGPoint(x: view.frame.width * 0.5, y: view.frame.height * 0.88)
        minusButton.backgroundColor = subColor
        minusButton.setTitle("minus", for: .normal)
        minusButton.setTitleColor(.brown, for: .normal)
        minusButton.setTitleColor(.white, for: .disabled)
        minusButton.layer.cornerRadius = 5
        
        minusButton.layer.shadowColor = UIColor.gray.cgColor
        minusButton.layer.shadowOpacity = 1.0
        minusButton.layer.shadowOffset = CGSize.zero
        minusButton.layer.shadowRadius = 6
    }
    
    func createPlusButtonConstraint() {
        
        plusButton.frame.size = CGSize(width: 100, height: 50)
        plusButton.center = CGPoint(x: view.frame.width * 0.5, y: view.frame.height * 0.80)
        plusButton.backgroundColor = subColor
        plusButton.setTitle("plus", for: .normal)
        plusButton.setTitleColor(.brown, for: .normal)
        plusButton.setTitleColor(.white, for: .disabled)
        plusButton.layer.cornerRadius = 5
        
        plusButton.layer.shadowColor = UIColor.gray.cgColor
        plusButton.layer.shadowOpacity = 1.0
        plusButton.layer.shadowOffset = CGSize.zero
        plusButton.layer.shadowRadius = 6
    }

}
