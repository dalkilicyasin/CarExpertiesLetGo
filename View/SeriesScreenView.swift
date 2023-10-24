//
//  SeriesScreenView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import SwiftUI
import Combine

struct SeriesScreenView: View {
    @ObservedObject var viewModel: SeriesScreenViewModel
    init(viewModel: SeriesScreenViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack{
            viewModel.color.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Please Select the model of year")
                    .foregroundStyle(.white).font(.largeTitle)
                ScrollView{
                    VStack {
                        ForEach(0..<viewModel.modelList.count, id: \.self){ index in
                            Button {
                                viewModel.goDetail = true
                            } label: {
                                NavigationLink(destination: SeriesScreenView(viewModel: SeriesScreenViewModel(makeId:" \(viewModel.modelList[index].id ?? 1)", model: viewModel.model)), isActive: $viewModel.goDetail){
                                    Text("\(viewModel.modelList[index].name ?? "")")
                                        .font(.title)
                                        .background(Color.white)
                                        .padding(25)
                                }
                            }
                        }
                    }
                }
            }
        }.onAppear{
            viewModel.fetch()
        }
    }
}

#Preview {
    SeriesScreenView(viewModel: SeriesScreenViewModel(makeId: "MakeId", model: "model"))
}
