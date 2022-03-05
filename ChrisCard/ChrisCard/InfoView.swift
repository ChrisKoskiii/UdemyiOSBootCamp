//
//  InfoView.swift
//  ChrisCard
//
//  Created by Christopher Koski on 3/4/22.
//

import SwiftUI

struct InfoView: View {
  
  let text: String
  let imageName: String
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 30)
        .fill(Color.white)
        .frame(height: 35)
      HStack {
        Image(systemName: imageName)
        Text(text)
          .font(.caption)
      }
    }
  }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
      InfoView(text: "Hello", imageName: "phone")
        .previewLayout(.sizeThatFits)
    }
}
