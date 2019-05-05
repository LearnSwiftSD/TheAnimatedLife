import UIKit

public extension UIView {
    
    /**
     This method wraps the translatesAutoresizingMaskIntoConstraints bool
     being set to false in order to provide better communication of what's
     happening.
     */
    func useAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    /**
     This method wraps the translatesAutoresizingMaskIntoConstraints bool
     being set to false in order to provide better communication of what's
     happening. Additionally the constraints passed in are activated.
     */
    func useAutoLayout(_ constraints: NSLayoutConstraint...) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    func snapTo(_ view: UIView) {
        useAutoLayout(
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        )
    }
    
}
