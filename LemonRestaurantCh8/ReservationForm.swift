//
//  ReservationForm.swift
//  LemonRestaurantCh8
//
//  Created by Kit Sitou on 3/19/26.
//

import SwiftUI

struct ReservationForm: View {
    //constants
    let restaurantName = "Lemon Restaurant"
    let maxGuess:Int = 10
    
    @State private var userName:String=""
    @State private var guestCount=1
    @State private var phoneNumber: String = ""
    @State private var previewText:String="no preview yet"
    
    var body: some View {
        Form{
            //--Header--
            Section{
                HStack{
                    Image(systemName:"fork.knife")
                        .font(.title2)
                        .foregroundColor(.blue)
                    VStack{
                        Text(restaurantName)
                            .font(.title3)
                            .bold()
                        Text("Reservation form")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        
                    }
                }
            }
            Section(header:Text("Reservation Details")){
                TextField("Name",text: $userName)
                    .autocorrectionDisabled(true)
                
                //--reservation details--
                Stepper("Guests:\(guestCount)", value: $guestCount, in: 1...maxGuess)

            }
            
            //--contact--
            Section(header:Text("Contact")){
                TextField("Phone", text: $phoneNumber)
                    .keyboardType(.numberPad)
            }
            //--action--
            Section(header:Text("Actions")){
                Button("Preview Reservation"){
                    previewText =
                    """
                    Name: \(userName)
                    Guest:\(guestCount)
                    Phone:\(phoneNumber)
                    """
                }
            }
                
            //--preview--
            Section(header: Text("Preview")){
                Text(previewText)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.vertical,4)
                    .textSelection(.enabled)
            }
            
            
        }//form
        
    }
}

#Preview {
    ReservationForm()
}
