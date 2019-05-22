/*:
 [Home](Welcome) | [Previous](@previous) | [Next](@next)
 # Transition Animation
 
 
 ___
 
 Transition animations are a great way to reveal new information are a change in state.
 Additionally, UIKit has several excellent premade ones ready to go out of the box. There's a
 little setup that needs to be done with them though. Let's take a look.
 */
import UIKit
import PlaygroundSupport

class ViewController: TransitionViewController, TransitionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        #warning("Assign the transitionView.delegate here")
    }
    
    func didRequestTransition(
        from currentView: UIView,
        in position: TransitionView.Position,
        to nextView: UIView,
        using transitionStyle: UIView.AnimationOptions
        ) -> TransitionView.Position {
        
        #warning("Animation Implementations Here")
        
        return position
    }
    
}

PlaygroundPage.current.liveView = ViewController()
//: [Home](Welcome) | [Previous](@previous) | [Next](@next)
