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
        transitionView.delegate = self
    }
    
    func didRequestTransition(
        from currentView: UIView,
        in position: TransitionView.Position,
        to nextView: UIView,
        using transitionStyle: UIView.AnimationOptions
        ) -> TransitionView.Position {
        
        let newOption: UIView.AnimationOptions = position == .primary
            ? .transitionFlipFromRight
            : .transitionFlipFromLeft

        UIView.transition(
            from: currentView,
            to: nextView,
            duration: 1.0,
            options: [newOption, .showHideTransitionViews],
            completion: nil
        )
        
        return position.toggled
    }
    
}

PlaygroundPage.current.liveView = ViewController()
//: [Home](Welcome) | [Previous](@previous) | [Next](@next)
