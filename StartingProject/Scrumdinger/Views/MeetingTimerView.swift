//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Kumar, Gaurav on 9/12/24.
//

import SwiftUI

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    private var currentSpeaker:String {
        speakers.first(where: { !$0.isCompleted})?.name ?? "Someone"
    }
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay{
                ForEach(speakers) { speaker in
                                 if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                                     SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                                         .rotation(Angle(degrees: -90))
                                         .stroke(theme.mainColor, lineWidth: 12)
                                 }
                             }
            }
            .padding(.horizontal)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers: [ScrumTimer.Speaker] {
          [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
      }
    static var previews: some View {
        MeetingTimerView(speakers: speakers, theme: .yellow)
    }
}
