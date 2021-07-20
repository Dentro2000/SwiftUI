


import SwiftUI

struct ShiftDetailView: View {
    
    @Binding var isPresented: Bool
    let shift: Shift
    
    var body: some View {
        
        
        
        VStack {
            Text(Strings.DetailsScreen.shiftDetails.rawValue).font(.system(size: 50))
            
            HStack {
                Text(Strings.DetailsScreen.covid.rawValue).bold()
                Text(shift.covid ? Strings.yes.rawValue : Strings.no.rawValue).font(.system(size: 20))
            }.padding()
            
            HStack {
                Text(Strings.DetailsScreen.premium.rawValue).bold()
                Text(shift.premiumRate ? Strings.yes.rawValue : Strings.no.rawValue).font(.system(size: 20))
            }.padding()
            
            
            HStack {
                Text(Strings.DetailsScreen.distance.rawValue).bold()
                Text("\(shift.withinDistance)").font(.system(size: 30))
            }.padding(15)
            
            HStack {
                Text(Strings.DetailsScreen.start.rawValue).bold()
                Text(shift.normalizedStartDateTime).font(.system(size: 20))
            }.padding()
            
            HStack {
                Text(Strings.DetailsScreen.end.rawValue).bold()
                Text(shift.normalizedEndDateTime).font(.system(size: 20))
            }.padding()
            
            HStack {
                Text(Strings.DetailsScreen.facility.rawValue).bold()
                Text(shift.facilityType.name).font(.system(size: 20))
            }.padding()
            
            HStack {
                Text(Strings.DetailsScreen.skill.rawValue).bold()
                Text(shift.skill.name).font(.system(size: 20))
            }.padding()
            
            HStack {
                Text(Strings.DetailsScreen.speciality.rawValue).bold()
                Text(shift.localizedSpecialty.name).font(.system(size: 20))
            }.padding()
            
            
        }.onTapGesture {
            self.isPresented.toggle()
        }
    }
}

struct ShiftDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftDetailView(isPresented: .constant(true),
                        shift: MockShift.mockShift)
    }
    
}
