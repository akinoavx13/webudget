//
//  EditTagScene.swift
//  WeBudget
//
//  Created by Maxime Maheo on 02/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

struct EditTagScene: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: EditTagSceneViewModel
    
    // MARK: - Body
    
    var body: some View {
        List {
            ForEach(viewModel.models) { model in
                TagComponent(model: model)
            }
            .onDelete { viewModel.delete(at: $0) }
        }
        .toolbar { EditButton() }
        .onAppear { viewModel.fetchTags() }
    }
}

#if DEBUG

struct EditTagScene_Previews: PreviewProvider {
    static var previews: some View {
        EditTagScene(viewModel: EditTagSceneViewModel.preview)
    }
}

#endif
