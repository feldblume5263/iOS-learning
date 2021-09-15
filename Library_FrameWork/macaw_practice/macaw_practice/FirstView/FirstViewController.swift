//
//  FirstViewController.swift
//  macaw_practice
//
//  Created by Junhong Park on 2021/09/14.
//

import UIKit

class FirstViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
   
    @IBAction func nextButtonPressed(_ sender: UIButton) {
//        performSegue(withIdentifier: "goToSecondView", sender: self)
        let rootView = presentingViewController
        
        print(rootView?.restorationIdentifier)

        self.dismiss(animated: true) {
            let secondVC = self.storyboard?.instantiateViewController(identifier: "secondVC") as! SecondViewController
            
            secondVC.modalPresentationStyle = .fullScreen
            rootView?.present(secondVC, animated: true, completion: nil)
            
        }
        

    }
    
    

    
}
