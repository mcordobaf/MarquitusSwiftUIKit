//
//  SwiftUIView.swift
//
//
//  Created by Marco Cordoba on 13-05-22.
//

import SwiftUI

struct StarRatingView: View {
  var corners: Int = 5
  var spacing: CGFloat = 4
  var minValue: Int = 1
  var maxValue: Int = 5
  var emptyColor: Color = Color.clear
  var shadowColor: Color = Color.black.opacity(0.3)
  var shadowRadius: CGFloat = 4
  var fillColor: Color = Color.yellow
  @Binding var value: Double?
  @State private var onHoverIndex: Int?

  var body: some View {
    HStack(spacing: spacing) {
      ForEach(minValue...maxValue, id: \.self) { indice in
        Button(action: {
        }, label: {
          StarRow(
            corners: corners,
            fillColor: fillColor,
            shadowColor: shadowColor,
            shadowRadius: shadowRadius)
        })
      }
    }
  }
}

struct StarRow: View {
  var corners: Int
  var smothness: CGFloat = 0.45
  var fillColor: Color
  var shadowColor: Color
  var shadowRadius: CGFloat
  var xShadow: CGFloat = 4
  var yShadow: CGFloat = .zero

  var body: some View {
    Star(
      corners: corners,
      smoothness: smothness)
    .fill(fillColor)
    .scaledToFit()
    .shadow(
      color: shadowColor,
      radius: shadowRadius,
      x: xShadow,
      y: yShadow)
  }
}

private extension StarRatingView {
  enum PrivateColors {

  }
}

#if DEBUG
struct StarRatingView_Previews: PreviewProvider {
  static var previews: some View {
    StarRatingView(value: .constant(0.0))
  }
}
#endif
