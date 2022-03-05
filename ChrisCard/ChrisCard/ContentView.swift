//
//  ContentView.swift
//  ChrisCard
//
//  Created by Christopher Koski on 3/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ZStack {
        Color(red: 0.09, green: 0.63, blue: 0.52)
          .ignoresSafeArea()
        VStack {
          Image("ChrisImage")
            .resizable().aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(
              Circle().stroke(Color.white, lineWidth: 5)
            )
          Text("Christopher Koski")
            .font(Font.custom("Pacifico-Regular", size: 40))
            .fontWeight(.bold)
          .foregroundColor(.white)
          Text("iOS Developer")
            .foregroundColor(.white)
            .font(.system(size: 25))
          Divider()
          InfoView(text: "561-601-8125", imageName: "phone")
          InfoView(text: "Ckoski18@gmail.com", imageName: "envelope")
        }
        .padding(.all)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
.previewInterfaceOrientation(.portrait)
    }
}

