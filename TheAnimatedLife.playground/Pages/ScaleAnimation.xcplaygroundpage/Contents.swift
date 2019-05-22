/*:
 [Home](Welcome) | [Previous](@previous) | [Next](@next)
 # Scale Bounce Animation


 ___
 
 For this example we have a button on screen that doesn't really communicate that it's being
 selected when pressed. Let's fix that by providing a scale animation that make the button
 appear to bounce when it's selected.
*/
import UIKit
import PlaygroundSupport

class ViewController: GradientViewController {
/*:
 This `runAnimation` method gets called each time the button experiences a `.touchUpInside`
 event (when the finger lifts off from pressing the button). Provide your implementation of
 the animation here.
 */
    override func runAnimation(button: UIButton) {
        
        func shrinkButton () -> Void {
            let shrink = CGAffineTransform(scaleX: 0.95, y: 0.95)
            let shrinkAndScoot = shrink.translatedBy(x: 0, y: 6)
            button.transform = shrinkAndScoot
        }
        
        func popBack(_ ignored: Bool) -> Void {
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
