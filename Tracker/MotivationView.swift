//
//  MotivationView.swift
//  Tracker
//
//  Created by Кирилл Чулков on 05.03.2020.
//  Copyright © 2020 Кирилл Чулков. All rights reserved.
//

import SwiftUI

struct MotivationView: View {
     let url = "https://avatars.mds.yandex.net/get-pdb/199965/bbab5cae-4d56-4bc7-9091-ea8ae1d59454/s1200"
     
     var body: some View {
         VStack {
            URLImage(withURL: url)
            Text("Прогрузится ли?")
         }
     }
}

struct MotivationView_Previews: PreviewProvider {
    static var previews: some View {
        MotivationView()
    }
}
