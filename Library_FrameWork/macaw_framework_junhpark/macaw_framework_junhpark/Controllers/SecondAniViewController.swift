//
//  SecondAniViewController.swift
//  macaw_framework_junhpark
//
//  Created by Junhong Park on 2021/09/16.
//

import UIKit

class SecondAniViewController: UIViewController {

    private var userFigure: Float = 50.0
    private var popViewHeight: CGFloat!
    
    let popBallTopView = PopBallCustomView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let popBallMiddleView = PopBallCustomView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let popBallBottomView = PopBallCustomView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    


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
        popViewHeight = view.frame.height * 0.4
        
        let nextButton = UIBarButtonItem(title: "next", style: .done, target: self, action: #selector(nextButtonPressed))
        self.navigationItem.rightBarButtonItem = nextButton
        
        popBallTopView.setShape(shape: 0)
        popBallMiddleView.setShape(shape: 1)
        popBallBottomView.setShape(shape: 2)
        
        view.addSubview(popBallTopView)
        view.addSubview(popBallMiddleView)
        view.addSubview(popBallBottomView)
        popBallTopView.alpha = 0.0
        popBallBottomView.alpha = 0.0
        createPopBallViewConstraint()
        
        view.addSubview(minusButton)
        createMinusButtonConstraint()
        view.addSubview(plusButton)
        createPlusButtonConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        popBallMiddleView.onComplete = {
            
            self.minusButton.isEnabled = true
        }
        
        let viewName = [popBallTopView, popBallMiddleView, popBallBottomView]
        
        for idx in 0 ... 2 {
            
            viewName[idx].prepareAnimation(figure: 50)
            viewName[idx].startAnimation()
        }
        
        minusButton.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        popBallMiddleView.animation?.stop()
        popBallTopView.animation?.stop()
        popBallBottomView.animation?.stop()
    }
    
    @objc func plusButtonPressed() {
        
        if (userFigure < 100) {
            
            popViewHeight = popViewHeight - (view.frame.height * 0.025)
            popBallTopView.center = CGPoint(x: view.frame.width * 0.5, y: popViewHeight)
            popBallMiddleView.center = CGPoint(x: view.frame.width * 0.5, y: popViewHeight)
            popBallBottomView.center = CGPoint(x: view.frame.width * 0.5, y: popViewHeight)
            userFigure = userFigure + 5
            
            if userFigure == 80 {
                
                popBallBottomView.alpha = 0.0
                popBallMiddleView.fadeOut()
                popBallTopView.fadeIn()
            }
            
            if userFigure == 30 {
                
                popBallTopView.alpha = 0.0
                popBallBottomView.fadeOut()
                popBallMiddleView.fadeIn()
            }
        }
    }
    
    @objc func minusButtonPressed() {
        
        if (userFigure > 0) {
            
            popViewHeight = popViewHeight + (view.frame.height * 0.025)
            popBallTopView.center = CGPoint(x: view.frame.width * 0.5, y: popViewHeight)
            popBallMiddleView.center = CGPoint(x: view.frame.width * 0.5, y: popViewHeight)
            popBallBottomView.center = CGPoint(x: view.frame.width * 0.5, y: popViewHeight)
            userFigure = userFigure - 5
        }
        
        if userFigure == 80 {
            
            popBallBottomView.alpha = 0.0
            popBallMiddleView.fadeIn()
            popBallTopView.fadeOut()
        }
        
        if userFigure == 30 {
            
            popBallTopView.alpha = 0.0
            popBallBottomView.fadeIn()
            popBallMiddleView.fadeOut()
        }
    }
    
    func createPopBallViewConstraint() {
        
        let viewName = [popBallTopView, popBallMiddleView, popBallBottomView]
        
        for idx in 0 ... 2 {
            
            viewName[idx].frame.size = CGSize(width: 380, height: 300)
            viewName[idx].center = CGPoint(x: view.frame.width * 0.5, y: popViewHeight)
            viewName[idx].backgroundColor = .clear
            viewName[idx].layer.cornerRadius = 10
        
            viewName[idx].layer.shadowColor = UIColor.gray.cgColor
            viewName[idx].layer.shadowOpacity = 1.0
            viewName[idx].layer.shadowOffset = CGSize.zero
            viewName[idx].layer.shadowRadius = 6
        }
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
    
    @objc func nextButtonPressed() {
        
        let viewControllerName = self.storyboard?.instantiateViewController(withIdentifier: "thirdAniVC")
        
        if let thirdAniView = viewControllerName {
            self.navigationController?.pushViewController(thirdAniView, animated: true)
        }
    }

}

public extension UIView {
    
 func fadeIn(duration: TimeInterval = 1.0) {
     UIView.animate(withDuration: duration, animations: {
        self.alpha = 1.0
     })
 }

func fadeOut(duration: TimeInterval = 1.0) {
    UIView.animate(withDuration: duration, animations: {
        self.alpha = 0.0
    })
  }
}
