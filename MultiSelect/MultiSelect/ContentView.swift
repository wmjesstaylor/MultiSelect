//
//  ContentView.swift
//  MultiSelect
//
//  Created by Jess Taylor on 8/7/20.
//  Copyright © 2020 Jess Taylor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let buttons = [0:"a", 1:"b", 2:"c", 3:"d", 4:"e", 5:"f"]
//    let buttons = [0:"a", 1:"b", 2:"c"]

    init() {
        // Apply Filters
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack (spacing: 0) {
                ForEach(self.buttons.sorted(by: <), id: \.key) { button in
                    ButtonView(isSelected: true, width: (geo.size.width / CGFloat(self.buttons.count)) * 0.80)
                }
            }
        }
    }
}

struct ButtonView: View {
    
    @State private var isSelected:Bool
    private let width:CGFloat!
    init(isSelected: Bool, width: CGFloat) {
        self._isSelected = State(wrappedValue: isSelected)
        self.width = width
    }
    
    var body: some View {
        Button(action: {
            self.isSelected.toggle()
            print("Applying Filter, selected = \(self.isSelected)")
        }) {
            Text("button.value")
        }
        .frame(width: self.width, height: 30.0, alignment: .center)
        .border(Color.blue)
        .foregroundColor(Color.black)
        .background(self.buttonColor)
    }
    
    var buttonColor: Color {
        return self.isSelected ? .blue : .gray
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
