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

    }
    
    @objc private func didTapButton() {
        runAnimation(button: gradientButton)
    }
    
    private func setupButton() {
        gradientButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(gradientButton)
        
        gradientButton.useAutoLayout(
            gradientButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            gradientButton.heightAnchor.constraint(equalToConstant: 60),
            gradientButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            gradientButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60)
        )
        
        let buttonBounds = CGRect(x: 0, y: 0, width: 300, height: 60)
        addGradient(withBounds: buttonBounds)
        addShadow(withBounds: buttonBounds)
        
        let buttonTitle = NSAttributedString(
            string: "Animated",
            attributes: [
                .foregroundColor : UIColor.white,
                .font : UIFont(name: "AvenirNext-DemiBold", size: 24)!
            ]
        )
        
        gradientButton.setAttributedTitle(buttonTitle, for: .normal)
    }
    
    private func addGradient(withBounds bounds: CGRect) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.gradientOrange.light,
            UIColor.gradientOrange.dark
            ].map { $0.cgColor }
        gradientLayer.frame = bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.cornerRadius = 10
        gradientButton.layer.insertSublayer(gradientLayer, at: 0)
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
