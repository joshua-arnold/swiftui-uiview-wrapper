//
//  Utils.swift
//  Demo
//
//  Created by Josh Arnold on 10/13/24.
//

import Foundation
import SwiftUI
import UIKit

// MARK: - UIViewWrapper

@available(iOS 16.0, *)
public struct UIViewWrapper<T: UIView>: UIViewRepresentable {
    public typealias UIViewType = T

    private let create: () -> T
    private let update: (T) -> Void

    /// Map a `UIView` to a `SwiftUI.View`
    /// - Parameters:
    ///   - create: This will be invoked once per the lifetime of the view. Do any expensive initialization here once.
    ///   - update: This will be invoked on each view update. Update your view properties here.
    public init(
        create: @escaping () -> T,
        update: @escaping (T) -> Void
    ) {
        self.create = create
        self.update = update
    }

    public func makeUIView(context: Context) -> UIViewType {
        create()
    }

    public func updateUIView(_ uiView: T, context: Context) {
        let shouldAnimate = context.transaction.animation != nil

        if shouldAnimate {
            UIView.animate(withDuration: 0.3) {
                update(uiView)
            }
        } else {
            update(uiView)
        }
    }

    public func sizeThatFits(
        _ proposal: ProposedViewSize,
        uiView: UIViewType,
        context _: Context
    ) -> CGSize? {

        // An optional hack for text based components
        // which can allow things like UILabel to be laid
        // out in the same way as `SwiftUI.Text`
        // by indicating the view is "flexible".
        //
        // Flexible views are typically laid out last I believe,
        // which can help get proper sizing when using two UILabels in an HStack
        // as an example.
        if proposal.width == .zero {
            return .zero
        }

        let targetSize = CGSize(
            width: proposal.width ?? UIViewType.noIntrinsicMetric,
            height: proposal.height ?? UIViewType.noIntrinsicMetric
        )

        let size = uiView.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .defaultHigh,
            verticalFittingPriority: .defaultLow
        )

        return size
    }
}
