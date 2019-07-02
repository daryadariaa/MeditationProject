//
//  MacawChartView.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 5/16/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//

import Foundation
import Macaw

class MacawChartView: MacawView {
    
    static var lastValues = createData()
    static var data: [Double] = lastValues
    static var palette: [Color] = []
    static var animatioms: [Animation] = []
    
    
    required init?(coder aDecoder: NSCoder) {
        let button = MacawChartView.createButton()
        let chart = MacawChartView.createChart(button)
        super.init(node: Group(contents: [button, chart]), coder: aDecoder)
        backgroundColor = .black
    }
    
    private static func createButton() -> Group {
        let shape = Shape(
            form: Rect(x: -100, y: -50, w: 220, h: 30).round(r: 5),
            fill: LinearGradient(degree: 90, from: Color(val: 0xfcc07c), to: Color(val: 0xfc7600)),
            stroke: Stroke(fill: Color(val: 0xff9e4f), width: 1))
        
        let text = Text(
            text: "Your mood rate", font: Font(name: "CoffeeService", size: 34),
            fill: Color.white, align: .mid, baseline: .mid,
            place: .move(dx: 15, dy: -35))
        
        return Group(contents: [shape, text], place: .move(dx: 375 / 2, dy: 75))
    }
    
    private static func createChart(_ button: Node) -> Group {
        var items: [Node] = []
        for i in 1...10 {
            let y = 200 - Double(i) * 30.0
            items.append(Line(x1: 0, y1: y, x2: 400, y2: y).stroke(fill: Color(val: 0xFFEBCE)))
            items.append(Text(text: "\(i*1)", fill: Color(val: 0xfc7600),  align: .max, baseline: .mid, place: .move(dx: -10, dy: y)))
        }
        items.append(createBars(button))
        items.append(Line(x1: 0, y1: 200, x2: 400, y2: 200).stroke(fill: Color(val: 0xfc7600)))
        items.append(Line(x1: 0, y1: -120, x2: 0, y2: 200).stroke(fill: Color(val: 0xfc7600)))
        return Group(contents: items, place: .move(dx: 50, dy: 200))
    }
    
    
    private static func createBars(_ button: Node) -> Group {
        
        var items: [Node] = []
        for (i, item) in lastValues.enumerated() {
            let bar = Shape(
                form: Rect(x: Double(i) * 50 + 25, y: 0, w: 30, h: -(item * 30.0)),
                fill: LinearGradient(degree: 90, from: palette[i], to: palette[i].with(a: 0.3)),
                place: .move(dx: 0, dy: 0))
            items.append(bar)
            let items_ = lastValues.map {_ in Group() }
            let fill_ = LinearGradient(degree: 90, from: palette[i], to: palette[i].with(a: 0.3))
            animatioms = items_.enumerated().map { (i: Int, item: Group) in
                item.contentsVar.animation(delay: Double(i) * 0.1) { t in
                    let height = lastValues[i] * t
                    let rect = Rect(x: Double(i) * 50 + 25, y: 200 - height, w: 30, h: height)
                    return [rect.fill(with: fill_)]
                }
            }
        }
        return Group(contents: items, place: .move(dx: 0, dy: 200))
    }
    
    static func playAnimations() {
        animatioms.combine().play()
    }
    
    
    static func createData() -> [Double] {
        var items: [Double] = []
        var moodValueArray = UserDefaults.standard.array(forKey: "ArrayOfMoodValues")  as? [Double] ?? [Double]()
        
        for i in 0..<moodValueArray.count {
            let item = moodValueArray[i]
            items.append(item)
            palette.append(Color.rgba(r: Int.random(in: 0...255), g: Int.random(in: 0...255), b: Int.random(in: 0...255), a: 0.7))
        }
        print(items)
        return items.reversed()
    }
}
