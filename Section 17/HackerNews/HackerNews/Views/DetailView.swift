//
//  DetailView.swift
//  HackerNews
//
//  Created by Bhanuka Gamage on 12/9/19.
//  Copyright © 2019 Bhanuka Gamage. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    let url : String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
