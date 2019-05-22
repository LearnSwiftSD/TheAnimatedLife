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
        #warning("Animation Implementations Here")
    }
    
}

PlaygroundPage.current.liveView = ViewController()
//: [Home](Welcome) | [Previous](@previous) | [Next](@next)
