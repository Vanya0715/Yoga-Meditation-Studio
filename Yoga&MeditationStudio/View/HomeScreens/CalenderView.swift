//
//  CalenderView.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 06/06/22.
//

import SwiftUI

struct CalenderView: View {
    private let calendar: Calendar
    private let monthDayformatter: DateFormatter
    private let dayFormatter: DateFormatter
    private let weekDayformatter: DateFormatter
    
    @State private var selectDate = Self.now
    private static var now = Date()
    
    init(calendar: Calendar ) {
        self.calendar = calendar
        self.monthDayformatter = DateFormatter(dateFormat: "dd/MM/YYYY", calendar: calendar)
        self.dayFormatter = DateFormatter(dateFormat: "d", calendar: calendar)
        self.weekDayformatter = DateFormatter(dateFormat: "EEEEE", calendar:calendar)
    }
    
    
    var body: some View {
        VStack {
            CalendarWeekListView(
                calendar: calendar,
                date: $selectDate,
                content:  { date in
                    Button(action: { selectDate = date }) {
                        VStack {
                            Text("00")
                                .foregroundColor(.clear)
                                .padding(8)
                                .font(.system(size: 13))
                                .overlay(
                                    Text(weekDayformatter.string(from: date))
                                        .font(.system(size: 15))
                                        .foregroundColor(
                                            calendar.isDate(date, inSameDayAs: selectDate) ? Color.white : calendar.isDateInToday(date) ? .pink
                                            : .black
                                        )
                                )
                            Text("00")
                                .foregroundColor(.clear)
                                .fontWeight(.medium)
                                .padding(8)
                                .font(.system(size: 13))
                                .overlay(
                                    Circle()
                                        .foregroundColor(
                                            calendar.isDate(date, inSameDayAs: selectDate) ? Color.white : calendar.isDateInToday(date) ? .pink.opacity(0.1)
                                            : .white.opacity(0.5)
                                        )
                                .overlay(
                                    
                                    Text(dayFormatter.string(from: date))
                                        .foregroundColor(
                                            calendar.isDate(date, inSameDayAs: selectDate) ? Color.black : calendar.isDateInToday(date) ? .pink
                                            : .black
                                        )
                                )
                              
                                        
                                      
                                        
                                
                                )
                        }
                  

                        .frame(width: 35, height: .infinity).padding(6)
                        .background(
                            Color.black
                            .opacity(calendar.isDate(date, inSameDayAs: selectDate) ? 1: 0))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            
                        

                    }
                  
                },
                title: { date in
                    HStack {
                        Text(monthDayformatter.string(from: selectDate))
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                    }
                },
                weekSwitcherL: { date in
                    Button {
                        withAnimation {
                            guard let newDate = calendar.date(byAdding: .day, value: -1, to: selectDate)
                            else {
                                return
                            }
                            selectDate = newDate
                        }
                    } label: {
                   
                          Image(systemName: "chevron.left")
                            
                        
                    }

                },
                weekSwitcherR: {date in
                    Button {
                        withAnimation {
                            guard let newDate = calendar.date(byAdding: .day, value: 1, to: selectDate)
                            else {
                                return
                            }
                            selectDate = newDate
                        }
                    } label: {
                            Image(systemName: "chevron.right")
                              }
                }
            )
        }
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView(calendar: Calendar(identifier: .gregorian))
    }
}

struct CalendarWeekListView<Day: View, Title: View, WeekSwitcherL: View, WeekSwitcherR: View>: View {
    private var calendar: Calendar
    @Binding private var date: Date
    private let content : (Date) -> Day
 
    private let title: (Date) -> Title
    private let weekswitcherL: (Date) -> WeekSwitcherL
    private let weekswitcherR: (Date) -> WeekSwitcherR
    
    private let daysInWeek = 7
    
    init(
        calendar: Calendar,
        date: Binding<Date>,
        @ViewBuilder content: @escaping (Date) -> Day,
     
        @ViewBuilder title: @escaping (Date) -> Title,
        @ViewBuilder weekSwitcherL: @escaping (Date) -> WeekSwitcherL,
        @ViewBuilder weekSwitcherR: @escaping (Date) -> WeekSwitcherR
    ) {
        self.calendar = calendar
        self.content = content

        self._date = date
        self.title = title
        self.weekswitcherL = weekSwitcherL
        self.weekswitcherR = weekSwitcherR
    }
    var body: some View{
        let month = date.startOfMonth(using: calendar)
        let days = makeDays()
        VStack {
            HStack {
                self.weekswitcherL(month)
                Spacer()
                self.title(month)
                Spacer()
                self.weekswitcherR(month)
              
                
            }.padding(.horizontal)
            
            HStack(spacing: 1) {
                    ForEach(days, id: \.self) {date in
                        content(date)
                    }
                }
        
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.all, 8)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black.opacity(0.3), radius: 8, x: 8, y: 8)
            .shadow(color: .white.opacity(0.3), radius: 10, x: -10, y: -10)
            .padding()
    }
    
}
private extension Date {
    func startOfMonth(using calendar: Calendar) -> Date {
        calendar.date(from: calendar.dateComponents([.year, .month], from: self)) ?? self
    }
}
private extension CalendarWeekListView {
    func makeDays() -> [Date] {
        guard let firstWeek = calendar.dateInterval(of: .weekOfMonth, for: date),
              let lastWeek = calendar.dateInterval(of: .weekOfMonth, for: firstWeek.end - 1)
        else {
            return []
            
        }
        
        let dateInterval = DateInterval(start:firstWeek.start, end: lastWeek.end)
        return calendar.generateDays(for: dateInterval)
    }
}
private extension Calendar {
    func generateDates(
        for dateInterval: DateInterval,
        matching components: DateComponents
    ) -> [Date] {
        var dates = [dateInterval.start]
        
        enumerateDates(
            startingAfter: dateInterval.start,
            matching: components,
            matchingPolicy: .nextTime)
        {
            date, _, stop in
            guard let date = date else { return }
            guard date < dateInterval.end else {
                stop =  true
                return
            }
            dates.append(date)
        }
        return dates
    }
    func generateDays(for dateInterval: DateInterval) -> [Date] {
        generateDates(for: dateInterval,
                        matching: dateComponents([.hour, .minute, .second], from: dateInterval.start)
        )
    }
}
private extension DateFormatter {
    convenience init(dateFormat: String, calendar: Calendar) {
        self.init()
        self.dateFormat = dateFormat
        self.calendar = calendar
        self.locale = Locale(identifier: "js_JP")
    }
}
