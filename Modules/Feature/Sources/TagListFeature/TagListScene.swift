//
//  TagListScene.swift
//  WeBudget
//
//  Created by Maxime Maheo on 02/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

struct TagListScene: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: TagListSceneViewModel
    
    // MARK: - Body
    
    var body: some View {
        List {
            ForEach(viewModel.models) { model in
                Button {
                    viewModel.presentTagDetails(uuid: model.id)
                } label: {
                    TagComponent(model: model)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .onDelete { viewModel.delete(at: $0) }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.presentTagDetails(uuid: nil)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .onAppear { viewModel.fetchTags() }
    }
}

#if DEBUG

struct TagListScene_Previews: PreviewProvider {
    static var previews: some View {
        TagListScene(viewModel: TagListSceneViewModel.preview)
    }
}

#endif
