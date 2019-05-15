//: [Home](Welcome) | [Previous](@previous) | [Next](@next)
//: # Transition Animation
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
