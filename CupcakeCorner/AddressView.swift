//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by gülçin çetin on 1.09.2025.
//


import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                    .onChange(of: order.name) { saveDetails() }
                
                TextField("Street Address", text: $order.streetAddress)
                    .onChange(of: order.streetAddress) { saveDetails() }
                
                TextField("City", text: $order.city)
                    .onChange(of: order.city) { saveDetails() }
                
                TextField("Zip", text: $order.zip)
                    .onChange(of: order.zip) { saveDetails() }
            }
            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: order)
                }
            }.disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func saveDetails() {
        UserDefaults.standard.set(order.name, forKey: "name")
        UserDefaults.standard.set(order.streetAddress, forKey: "streetAddress")
        UserDefaults.standard.set(order.city, forKey: "city")
        UserDefaults.standard.set(order.zip, forKey: "zip")
    }
}

#Preview {
    AddressView(order: Order())
}
