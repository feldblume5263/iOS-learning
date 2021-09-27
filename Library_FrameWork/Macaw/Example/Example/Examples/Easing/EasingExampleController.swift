import UIKit

class EasingExampleController: UIViewController {
    
    @IBOutlet weak var easingView: EasingView!
    
    private var easingView2 = EasingView(frame: CGRect(x: 100, y: 100, width: 400, height: 400))
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        easingView.prepareAnimation()
        easingView.animation.play()
        easingView2.prepareAnimation()
        easingView2.animation.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        easingView.animation.stop()
        easingView2.animation.stop()
    }    
}
