//
//  ProductView.swift
//  GreenFootprint
//
//  Created by Eldiiar on 3/6/24.
//

import SwiftUI
import Kingfisher

struct ProductView: View {
    var product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                KFImage(URL(string: product.image))
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(product.name)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    
                    Text("\(product.price) $")
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    
                    Text(product.description)
                    
                }
                
                Text("Sustainability")
                    .font(.headline)
                ForEach(product.sustainability, id: \.self) { data in
                    HStack(spacing: 5) {
                        Text("-")
                        Text(data)
                            .font(.callout)
                    }
                    
                }
                
            }
            .padding()
        }
        
    }
}
