//
//  TagDetailsScene.swift
//  WeBudget
//
//  Created by Maxime Maheo on 03/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI
import Core

struct TagDetailsScene: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: TagDetailsSceneViewModel
    
    // MARK: - Body
    
    var body: some View {
        Form {
            Section {
                TextField(Translator.name, text: $viewModel.tagName)
            } header: {
                Text(Translator.name)
            } footer: {
                Text(Translator.xTransactions(value: viewModel.transactionsCount))
            }

            Section {
                Button {
                    viewModel.save()
                } label: {
                    Label(Translator.save, systemImage: "square.and.arrow.down.fill")
                }
                Button {
                    viewModel.delete()
                } label: {
                    Label(Translator.delete, systemImage: "trash")
                        .foregroundColor(.red)
                }
            }
            
            Section {
                Button {
                    viewModel.cancel()
                } label: {
                    Text(Translator.cancel)
                }
            }
        }
        .onAppear { viewModel.fetchTag() }
    }
}

#if DEBUG

struct TagDetailsScene_Previews: PreviewProvider {
    static var previews: some View {
        TagDetailsScene(viewModel: TagDetailsSceneViewModel.preview)
    }
}

#endif
