import PlaygroundSupport
import UIKit

PlaygroundPage.current.needsIndefiniteExecution = true

let loadingExample = LoadingExample.create()

PlaygroundPage.current.liveView = loadingExample

class AnimatedLoginController: LoginViewController {
    
    override func runLoadingAnimation(logo: UIView, background: UIView) {
        
        let degrees = CGFloat(180 * Double.pi / 180)
        
        UIView.animate(
            withDuration: 1.0,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                let transform = CGAffineTransform(scaleX: 3, y: 3)//.rotated(by: degrees)
                let transform3D = CATransform3DMakeRotation(degrees, 0, 1, 0)
                logo.transform = transform
                logo.layer.transform = CATransform3DConcat(logo.layer.transform, transform3D)
                logo.alpha = 0
        },
            completion: nil
        )
        
        UIView.animate(
            withDuration: 1.25,
            delay: 0.25,
            options: .curveEaseIn,
            animations: {
                background.backgroundColor = UIColor.white
                background.alpha = 0
        },
            completion: { _ in background.removeFromSuperview() })
        
    }
    
}

executeAfter(2) {
    loadingExample.pushViewController(AnimatedLoginController(), animated: false)
}
