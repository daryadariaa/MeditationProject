import Foundation

class TrackTemplateFactory {
    
    public static var shared = TrackTemplateFactory()
    
    let appName = "De-Stress"
    let requireMeditationsBeDoneInOrder = false
    
    var trackTemplates = [TrackTemplate]()
    var minimumTrackDuration = 0
    
    public init() {
        
        trackTemplates.append(TrackTemplate(shortName: "Timer", name: "Timer", part1Url: URL(fileURLWithPath: Bundle.main.path(forResource: "bell_sound", ofType: "mp3")!), part2Url: URL(fileURLWithPath: Bundle.main.path(forResource: "bell_sound", ofType: "mp3")!)))
        
        trackTemplates.append(TrackTemplate(shortName: "Mindfulness Practice", name: "Introduction", part1Url: URL(fileURLWithPath: Bundle.main.path(forResource: "BriefMindfulnessPractice", ofType: "mp3")!), part2Url: nil))
        
        trackTemplates.append(TrackTemplate(shortName: "Mindfulness Breathing", name: "Mindfulness Breathing", part1Url: URL(fileURLWithPath: Bundle.main.path(forResource: "3MinuteBreathing", ofType: "mp3")!), part2Url: URL(fileURLWithPath: Bundle.main.path(forResource: "5MinuteBreathing", ofType: "mp3")!)))
        
        trackTemplates.append(TrackTemplate(shortName: "Body Scan", name: "Body Scan", part1Url: URL(fileURLWithPath: Bundle.main.path(forResource: "4MinuteBodyScan", ofType: "mp3")!), part2Url: URL(fileURLWithPath: Bundle.main.path(forResource: "BodyScan", ofType: "mp3")!)))
        
        trackTemplates.append(TrackTemplate(shortName: "Sitting Meditation", name: "Sitting Meditation", part1Url: URL(fileURLWithPath: Bundle.main.path(forResource: "SittingMeditation", ofType: "mp3")!), part2Url: nil))
        
        trackTemplates.append(TrackTemplate(shortName: "Zen Meditation", name: "Zen Meditation", part1Url: URL(fileURLWithPath: Bundle.main.path(forResource: "CompleteMeditation", ofType: "mp3")!), part2Url: nil))
        
        trackTemplates.append(TrackTemplate(shortName: "Yoga Meditation", name: "Yoga Meditation", part1Url: URL(fileURLWithPath: Bundle.main.path(forResource: "MindfulYoga", ofType: "mp3")!), part2Url: nil))
        
        trackTemplates.append(TrackTemplate(shortName: "Noting Meditation", name: "Noting Meditation", part1Url: URL(fileURLWithPath: Bundle.main.path(forResource: "CompassionateBreath", ofType: "mp3")!), part2Url: nil))
        
        trackTemplates.append(TrackTemplate(shortName: "Visualization", name: "Visualization", part1Url: URL(fileURLWithPath: Bundle.main.path(forResource: "MountainMeditation", ofType: "mp3")!), part2Url: URL(fileURLWithPath: Bundle.main.path(forResource: "MountainMeditation2", ofType: "mp3")!)))
        
        trackTemplates.append(TrackTemplate(shortName: "Brief Silent Meditation", name: "Brief Silent Meditation", part1Url: URL(fileURLWithPath: Bundle.main.path(forResource: "5MinuteJustBells", ofType: "mp3")!), part2Url: nil))
        
        trackTemplates.append(TrackTemplate(shortName: "Silent Meditation", name: "Silent Meditation", part1Url: URL(fileURLWithPath: Bundle.main.path(forResource: "10MinuteJustBells", ofType: "mp3")!), part2Url: nil))
        
        trackTemplates.forEach { (trackTemplate) in
            if(trackTemplate.minimumDuration > minimumTrackDuration) {
                minimumTrackDuration = trackTemplate.minimumDuration
            }
        }
    }
    
}

