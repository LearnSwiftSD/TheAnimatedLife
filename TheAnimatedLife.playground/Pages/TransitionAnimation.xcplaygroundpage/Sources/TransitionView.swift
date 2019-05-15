import UIKit

public typealias ClassBoundProtocol = AnyObject

public protocol TransitionViewDelegate: ClassBoundProtocol {
    
    func didRequestTransition(
        from currentView: UIView,
        in position: TransitionView.Position,
        to nextView: UIView,
        using transitionStyle: UIView.AnimationOptions
        ) -> TransitionView.Position
    
}

public class TransitionView: UIView {
    
    private var primaryView: UIView!
    private var secondaryView: UIView!
    private var transitionStyle: UIView.AnimationOptions!
    private var currentPosition: Position = .primary
    
    public weak var delegate: TransitionViewDelegate?
    
    public static func create(
        primary: UIView,
        secondary: UIView,
        transitionStyle: UIView.AnimationOptions
        ) -> TransitionView {
        
        let transitionView = TransitionView(frame: CGRect.zero)
        transitionView.transitionStyle = transitionStyle
        transitionView.setupPrimary(view: primary)
        transitionView.setupSecondary(view: secondary)
        return transitionView
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private var viewForState: (current: UIView, next: UIView) {
        return currentPosition == .primary
            ? (primaryView, secondaryView)
            : (secondaryView, primaryView)
    }
    
    public func transition() {
        guard let transitionViewDelegate = delegate else { return }
        currentPosition = transitionViewDelegate.didRequestTransition(
            from: viewForState.current,
            in: currentPosition,
            to: viewForState.next,
            using: transitionStyle
        )
    }
    
}

extension TransitionView {
    
    private func setupPrimary(view: UIView) {
        primaryView = view
        addSubview(primaryView)
        primaryView.snapTo(self)
    }
    
    private func setupSecondary(view: UIView) {
        secondaryView = view
        insertSubview(secondaryView, belowSubview: primaryView)
        secondaryView.snapTo(self)
    }
    
}

extension TransitionView {
    
    public enum Position {
        
        case primary, secondary
        
        public var toggled: Position {
            switch self {
            case .primary:
                return .secondary
            case .secondary:
                return .primary
            }
        }
        
    }
    
}
