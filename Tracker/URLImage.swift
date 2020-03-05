//
//  URLImage.swift
//  Tracker
//
//  Created by Кирилл Чулков on 05.03.2020.
//  Copyright © 2020 Кирилл Чулков. All rights reserved.
//

import Foundation
import SwiftUI

struct URLImage: View {
    
    @ObservedObject var imageLoader:ImageLoader
    @State var image: UIImage = UIImage(systemName: "photo") ?? UIImage()
    
    init(withURL url: String) {
        imageLoader = ImageLoader(urlString: url)
    }
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:200, height:200)
        }.onReceive(imageLoader.didChange) { data in
            self.image = UIImage(data: data) ?? UIImage()
        }
    }
}
