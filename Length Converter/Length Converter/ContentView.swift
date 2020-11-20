import SwiftUI

struct ContentView: View {
    @State private var fromAmount = "0"
    @State private var selectedFromUnit = 0
    @State private var selectedToUnit = 1
    
    let units: [String ] = ["km", "mi"]
    let milesToKm: Double = 1.609344
    let kmToMiles: Double = 0.621371
    
    var convertedAmount: Double {
        if let fromAmountData = Double(fromAmount) {
            if selectedFromUnit == selectedToUnit {
                return fromAmountData
            } else {
                switch units[selectedFromUnit] {
                case "km":
                    return fromAmountData * kmToMiles
                case "mi":
                    return fromAmountData * milesToKm
                default:
                    return fromAmountData
                }
            }
        
        }
        
        return 0.0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Data")) {
                    TextField("Unit Amount", text: $fromAmount)
                        .keyboardType(.decimalPad)
                    Picker("From Units", selection: $selectedFromUnit)  {
                        ForEach(0 ..< units.count){
                            Text("\(units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Picker("To Units", selection: $selectedToUnit)  {
                        ForEach(0 ..< units.count){
                            Text("\(units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output Data")) {
                    Text("\(convertedAmount) \(units[selectedToUnit])")
                }
            }.navigationBarTitle("Distance Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
