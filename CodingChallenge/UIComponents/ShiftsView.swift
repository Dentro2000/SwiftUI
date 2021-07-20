//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    
    @EnvironmentObject var viewModel: ShiftsViewModel
    @State var isAlertPresented = false
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                Group {
                    if (viewModel.shifts.isEmpty) {
                        ProgressView()
                    } else if (!viewModel.shifts.allDaysEmpty) {
                        List {
                            ForEach(viewModel.shifts.filterEmptyDays, id:\.date) {
                                shiftDay in
                                ShiftsGridView(shifts: shiftDay.shifts,
                                               date: shiftDay.date,
                                               columnsSize: geometry.size.width * 0.4,
                                               buttonSize: geometry.size.width * 0.4)
                                
                            }
                            Text("").onAppear(perform: {
                                if let _ = self.viewModel.shifts.last {
                                    viewModel.fetchShifts(week: viewModel.incrementCounter())
                                }
                            })
                        }
                    }
                    else {
                        if(viewModel.shifts.allDaysEmpty) {
                            Button(Strings.ShiftsView.noShifts.rawValue) {
                                viewModel.fetchShifts(week: viewModel.resetCounter())
                            }
                        }
                    }
                }.navigationBarTitle(Strings.ShiftsView.navBarTitle.rawValue)
            }
        }
    }
    
    private func headerView(date: String) -> some View {
        return HStack {
            Text(date)
        }
        .border(.black)
    }
}

struct ShiftsView_Previews: PreviewProvider {
    static let viewModel = ShiftsViewModel()
    
    static var previews: some View {
        ShiftsView().environmentObject(viewModel)
    }
}
