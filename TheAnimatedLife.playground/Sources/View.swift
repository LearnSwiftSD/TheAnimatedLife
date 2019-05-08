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
    
    enum Orientation { case descending, ascending, leading, trailing }
    
    /**
     Add the gradient color to the view with four directional options to choose from.
     - Parameters:
     - colors: An Array of colors to make up the gradient
     - orientation: The direction of the gradient
     - layerPosition: The postion of the gradient layer in the layer heirarchy
     - Returns: Void
     */
    func addLinearGradient(
        colors: [UIColor],
        bounds: CGRect? = nil,
        orientation: Orientation? = nil,
        layerPosition: UInt32? = nil
        ) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.frame = bounds ?? self.bounds
        
        if let orientationSpecified = orientation {
            switch orientationSpecified {
            case .ascending:
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
            case .descending:
                break
            case .leading:
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            case .trailing:
                gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
            }
        }
        
        layer.insertSublayer(gradientLayer, at: layerPosition ?? 0)
    }
    
}
