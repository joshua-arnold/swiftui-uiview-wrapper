//
//  ContentView.swift
//  Demo
//
//  Created by Josh Arnold on 10/13/24.
//

import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    @State var isVisible: Bool = true

    var body: some View {
        uiLabel        
            .animation(.default, value: isVisible)
            .onTapGesture {
                isVisible.toggle()
            }
    }
    
    private var uiLabel: some View {
        UIViewWrapper<UILabel> {
            // Initialize the view once
            let label = UILabel()
            label.numberOfLines = 0
            return label
        } update: { label in
            // Update the view on re-draw
            label.text =
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            label.alpha = isVisible ? 1 : 0
        }
        // Add some swiftui styling
        .padding()
        .background(.quaternary)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
        .contentShape(Rectangle())
    }
}

#Preview {
    ContentView()
}
