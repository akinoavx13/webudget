//
//  TagDetailsScene.swift
//  WeBudget
//
//  Created by Maxime Maheo on 03/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

struct TagDetailsScene: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: TagDetailsSceneViewModel
    
    // MARK: - Body
    
    var body: some View {
        Text("Hello, World")
    }
}

#if DEBUG

struct TagDetailsScene_Previews: PreviewProvider {
    static var previews: some View {
        TagDetailsScene(viewModel: TagDetailsSceneViewModel.preview)
    }
}

#endif
