import UIKit

open class GradientViewController: UIViewController {
    
    private let gradientButton = UIButton(type: .custom)
    
    open override func loadView() {
        let gradientView = UIView(frame: CGRect(x: 0, y: 0, width: 768.0, height: 1024.0))
        gradientView.addLinearGradient(colors: [
            UIColor.gradientGray.light,
            UIColor.gradientGray.dark
            ]
        )
        view = gradientView
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    open func runAnimation(button: UIButton) {
        //Implement in overrided method
    }
    
    @objc
    private func didTapButton() {
        runAnimation(button: gradientButton)
    }
    
}

extension GradientViewController {
    
    private func setupButton() {
        
        view.addSubview(gradientButton)
        
        gradientButton.useAutoLayout(
            gradientButton.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            gradientButton.heightAnchor
                .constraint(equalToConstant: 60),
            gradientButton.centerXAnchor
                .constraint(equalTo: view.centerXAnchor, constant: 0),
            gradientButton.centerYAnchor
                .constraint(equalTo: view.centerYAnchor, constant: 60)
        )
        
        let buttonTitle = NSAttributedString(
            string: "Animated",
            attributes: [
                .foregroundColor : UIColor.white,
                .font : UIFont(name: "AvenirNext-DemiBold", size: 24)!
            ]
        )
        
        gradientButton.setAttributedTitle(buttonTitle, for: .normal)
        gradientButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        let buttonBounds = CGRect(x: 0, y: 0, width: 300, height: 60)
        addGradient(withBounds: buttonBounds)
        addShadow(withBounds: buttonBounds)
        
    }
    
    private func addGradient(withBounds bounds: CGRect) {
        let gradients = UIColor.gradientOrange
        gradientButton.addLinearGradient(
            colors: [gradients.light, gradients.dark],
            bounds: bounds,
            orientation: .leading
            ).cornerRadius = 10
    }
    
    private func addShadow(withBounds bounds: CGRect) {
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: 10
            ).cgPath
        shadowLayer.fillColor = UIColor.gradientOrange.light.cgColor
        shadowLayer.shadowColor = UIColor.gradientOrange.light.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = CGSize(width: 0, height: 7.0)
        shadowLayer.shadowOpacity = 0.4
        shadowLayer.shadowRadius = 10
        gradientButton.layer.insertSublayer(shadowLayer, at: 0)
    }
    
}
