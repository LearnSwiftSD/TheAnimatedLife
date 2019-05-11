//: [Previous](@previous)
import UIKit
import QuartzCore
import PlaygroundSupport

//struct Emitter {
//
//    static func create(with image: UIImage) -> CAEmitterLayer {
//
//         Emitter.createEmitterCells(with: image)
//        return emitterLayer
//    }
//
//    static func createEmitterCells(with image: UIImage) -> [CAEmitterCell] {
//        var cells = [CAEmitterCell]()
//        let cell = CAEmitterCell()
//        cell.contents = image.cgImage
//        cell.birthRate = 1
//        cell.lifetime = 50.0
//        cell.velocity = 25.0
//        cell.velocityRange = 2.0
//        cell.emissionLongitude = (45 * (.pi/180))
//        cell.scale = 1.0
//        cell.scaleRange = 0
//        cells.append(cell)
//        return cells
//    }
//}

class SampleEmitter: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let emitterLayer = CAEmitterLayer()
        view.layer.addSublayer(emitterLayer)
        emitterLayer.emitterShape = .line
        var cells = [CAEmitterCell]()
        let cell = CAEmitterCell()
        cell.contents =
            UIImage(imageLiteralResourceName: "YellowDust").cgImage
        cell.birthRate = 1
        cell.lifetime = 50.0
        cell.velocity = 25.0
        cell.velocityRange = 2.0
        cell.emissionLongitude = (45 * (.pi/180))
        cell.scale = 1.0
        cell.scaleRange = 0
        cells.append(cell)
        emitterLayer.emitterCells = cells
        emitterLayer.position = CGPoint(x: view.frame.width / 2, y: 0)
        emitterLayer.emitterSize = CGSize(width: view.frame.width, height: 2)
    }
    
}



PlaygroundPage.current.liveView = SampleEmitter()

//: [Next](@next)
