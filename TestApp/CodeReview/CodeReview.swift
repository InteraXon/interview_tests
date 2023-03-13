import Foundation
import UIKit

protocol Operator {
    func run(arg: Float) -> Float
}

class OperatorA: Operator {
    func run(arg: Float) -> Float {
        arg*arg
    }
}

class OperatorB: Operator {
    var timeIndex: Float!
    var dateMaker: (()->(Date))

    init(dateMaker: @escaping(()->(Date)) = { Date() }) {
        self.dateMaker = dateMaker
    }

    func prepare() {
        timeIndex = Float(dateMaker().timeIntervalSince1970)
    }

    func run(arg: Float) -> Float {
        let result = 2*arg*timeIndex
        timeIndex = nil
        return result
    }
}

class Processor {
    let operators: [Operator]
    let provider: Provider

    init() {
        operators = [OperatorA(), OperatorB(), OperatorA()]
        provider = Provider()
    }

    func run(arg: Float) -> Float {
        var accumulator: Float = 0
        for op in operators {
            if let opB = op as? OperatorB {
                opB.prepare()
            }
            accumulator += op.run(arg: arg)
        }
        accumulator = applyModifierA(accumulator)
        accumulator = applyModifierB(accumulator)
        return accumulator
    }

    func applyModifierA(_ value: Float) -> Float {
        (value + 1.756) * 2.56
    }

    func applyModifierB(_ value: Float) -> Float {
        var result = value
        for _ in 0..<Int(value) % 7 {
            result += result * 1.1
            result += (value + 1.756) * 2.56
        }
        return result
    }

    func visualize(_ value: Float) -> UIView {
        let bar = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: CGFloat(value)))
        bar.backgroundColor = .red
        bar.layer.cornerRadius = 4.0
        return bar
    }
}

class Provider {
    let processor: Processor

    init() {
        processor = Processor()
    }

    func main() {
        var bars: [UIView] = []
        for i in 0..<10 {
            let result = processor.run(arg: Float(i))
            let bar = processor.visualize(result)
            bars.append(bar)
        }
    }
}
