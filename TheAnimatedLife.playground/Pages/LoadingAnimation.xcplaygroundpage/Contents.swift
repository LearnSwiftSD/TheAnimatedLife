/*:
 [Home](Welcome) | [Previous](@previous) | [Next](@next)
 # Loading Screen Animation
 
 ___
 
 Loading animations are a great way to provide visual interest and help to transition into the app.
 In this example we're going to do just that. We've provided an overlay to the Login Screen of an
 app that is identical to the loading image. When loading is complete we'll provide an animation
 that removes that overlay and transitions to the login screen.
 */
import PlaygroundSupport
import UIKit

// Setup to simulate the transition between a loading screen and the app
PlaygroundPage.current.needsIndefiniteExecution = true
let loadingExample = LoadingExample.create()
PlaygroundPage.current.liveView = loadingExample

class AnimatedLoginController: LoginViewController {
/*:
 This `runLoadingAnimation` method gets called when loading has been completed. Provide your
 implementation of the animation here.
 */
    override func runLoadingAnimation(logo: UIView, background: UIView) {
        #warning("Animation Implementations Here")
    }
    
}

// This activates the transition to the app.
executeAfter(2) {
    loadingExample.pushViewController(AnimatedLoginController(), animated: false)
}

//: [Home](Welcome) | [Previous](@previous) | [Next](@next)
