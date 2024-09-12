//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Kumar, Gaurav on 9/12/24.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("An error has occurred!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action:{dismiss()}) {
                        Text("Dismiss")
                    }
                })
            }
        }
    
    }
}

struct ErrorView_Previews:PreviewProvider {
    enum SampleError:Error {
        case errorRequired
    }
    static var wrapper:ErrorWrapper {
        ErrorWrapper(error:SampleError.errorRequired, guidance: "You can safely ingore this error.")
    }
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
