//: [Home](Welcome) | [Previous](@previous) | [Next](@next)
//: # Scale Bounce Animation
import UIKit
import PlaygroundSupport

class ViewController: GradientViewController {
    
    override func runAnimation(button: UIButton) {
        
        var shrinkButton: () -> Void {
            return {
                let shrink = CGAffineTransform(scaleX: 0.95, y: 0.95)
                let shrinkAndScoot = shrink.translatedBy(x: 0, y: 6)
                button.transform = shrinkAndScoot
            }
        }
        
        var popBack: (Bool) -> Void {
            return { completed in
                guard completed else { return }
                UIView.animate(
                    withDuration: 0.35,
                    delay: 0,
                    usingSpringWithDamping: 0.4,
                    initialSpringVelocity: 10,
                    options: [],
                    animations: { button.transform = .identity },
                    completion: nil
                )
            }
        }
        
        UIView.animate(
            withDuration: 0.1,
            delay: 0,
            options: [.curveEaseIn],
            animations: shrinkButton,
            completion: popBack
        )
        
    }
    
}

PlaygroundPage.current.liveView = ViewController()
//: [Home](Welcome) | [Previous](@previous) | [Next](@next)
