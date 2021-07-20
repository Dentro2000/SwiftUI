import SwiftUI

struct ShiftCell: View {
    
    @State private var isPresented = false
    
    let side: CGFloat
    let shift: Shift
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            VStack {
                
                Text(shift.shiftKind).bold()
                    .padding()
                    .lineLimit(1)
            }
            
            VStack {
                Text(shift.premiumRate ? Strings.ShiftCell.premiumRate.rawValue : Strings.empty.rawValue )
                Text(shift.covid ? Strings.ShiftCell.covidShift.rawValue : Strings.empty.rawValue)
                Text(Strings.ShiftCell.distance.rawValue + String(shift.withinDistance)).multilineTextAlignment(.leading)
            }
            
            
            
            
        }.frame(width: side, height: side, alignment: .leading)
            .border(.black)
            .onTapGesture {
                self.isPresented.toggle()
            }
            .sheet(isPresented: $isPresented) {
                ShiftDetailView(isPresented: $isPresented, shift: shift)
            }
        
        
    }
}

struct ShiftButton_Previews: PreviewProvider {
    
    static var previews: some View {
        ShiftCell(side: CGFloat(200),
                  shift: MockShift.mockShift
        )
    }
}

