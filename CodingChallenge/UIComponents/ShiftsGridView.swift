import SwiftUI

struct ShiftsGridView: View {
    
    let shifts: [Shift]
    let date: String
    let columnsSize: CGFloat
    let buttonSize: CGFloat
    
    var body: some View {
        
        LazyVGrid(columns: [
            GridItem(.fixed(columnsSize)),
            GridItem(.fixed(columnsSize)),
            
        ], pinnedViews: [.sectionHeaders]) {
            Section(header: headerView(date: date)) {
                
                ForEach(shifts, id:\.shiftId) { shift in
                    ShiftCell(side: buttonSize,
                              shift: shift)
                }
                
            }
            
            
        }.frame(alignment: .leading)
    }
    
    func headerView(date: String) -> some View {
        return Text(date).accessibility(identifier: Strings.AccesibilityIdentifiers.gridHeader.rawValue )
    }
    
    
}

struct ShiftsGridView_Previews: PreviewProvider {
    
    static var previews: some View {
        ShiftsGridView(shifts: [MockShift.mockShift, MockShift.mockShift, MockShift.mockShift, MockShift.mockShift], date: "2021-07-21", columnsSize: 400, buttonSize: 100
        )
    }
}

