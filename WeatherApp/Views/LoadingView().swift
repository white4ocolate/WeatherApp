//
//  LoadingView().swift
//  WeatherApp
//
//  Created by white4ocolate on 01.08.2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .tint(.white)//it should be white because we set our preffered theme to dark
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
