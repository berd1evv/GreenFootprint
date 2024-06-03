//
//  ContentView.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    @State private var showProduct: Bool = false
    @State private var selectedProduct: Product = Product()
    
    var body: some View {
        List(viewModel.products) { product in
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.headline)
                Text(product.description)
                    .font(.subheadline)
                
                KFImage(URL(string: product.image))
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
            }
            .padding()
            .onTapGesture {
                selectedProduct = product
                showProduct = true
            }
        }
        .navigationDestination(isPresented: $showProduct, destination: {
            ProductView(product: selectedProduct)
        })
        .navigationTitle("Eco-Friendly Products")
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}
