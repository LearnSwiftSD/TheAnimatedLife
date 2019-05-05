import UIKit

public class LoadingExample: UINavigationController {
    
    public override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        navigationBar.isHidden = true
    }
    
    public static func create() -> LoadingExample {
        return LoadingExample(rootViewController: LoadingViewController())
    }
    
}
