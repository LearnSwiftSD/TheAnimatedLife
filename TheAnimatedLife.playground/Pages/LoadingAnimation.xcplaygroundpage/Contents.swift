//: [Home](Welcome) | [Previous](@previous) | [Next](@next)
//: # Loading Screen Animation
import PlaygroundSupport
import UIKit

// This allows us to do run time-based executions
PlaygroundPage.current.needsIndefiniteExecution = true

// Create the LoadingExample which is a `UINavigationController`
let loadingExample = LoadingExample.create()

// This assigns the loadingExample as the Live View to the right
PlaygroundPage.current.liveView = loadingExample

// Example controller to do our animations in.
class AnimatedLoginController: LoginViewController {
//: Provide your animation implementation here in `runLoadingAnimation`.
    override func runLoadingAnimation(logo: UIView, background: UIView) {
        
        let degrees = CGFloat(180 * Double.pi / 180)
        let transform2D = CGAffineTransform(scaleX: 3, y: 3)
        let transform3D = CATransform3DMakeRotation(degrees, 0, 1, 0)
        
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
                        logo.transform = transform2D
                        let combined2DAnd3D = CATransform3DConcat(logo.layer.transform, transform3D)
                        logo.layer.transform = combined2DAnd3D
                        logo.alpha = 0
        },
                       completion: nil
        )
        
        UIView.animate(withDuration: 1.25,
                       delay: 0.25,
                       options: .curveEaseIn,
                       animations: {
                        background.backgroundColor = UIColor.white
                        background.alpha = 0
        },
                       completion: { _ in background.removeFromSuperview() }
        )
        
    }
    
}

// This simulates the completion of Loading an app.
executeAfter(2) {
    loadingExample.pushViewController(AnimatedLoginController(), animated: false)
}

//: [Home](Welcome) | [Previous](@previous) | [Next](@next)
