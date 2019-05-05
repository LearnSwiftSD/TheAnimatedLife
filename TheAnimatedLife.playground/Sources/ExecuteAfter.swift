import Foundation

public func executeAfter(_ time: TimeInterval, action: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + time, execute: action)
}
