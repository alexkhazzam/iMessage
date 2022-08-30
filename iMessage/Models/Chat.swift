//
//  Chat.swift
//  iMessage
//
//  Created by Alexander Khazzam on 8/30/22.
//

let possibleTextMessages: [String] = [
    "Hey, how are you?",
    "I am good, wbu?",
    "Sounds good; I'll meet you there.",
    "Sure, but ask brandon what he thinks.",
    "Not everybody agrees with the Jedi order.",
    "Anakin Skywalker was Luke Skywalker's father. Did you know that?",
    "Not all Jedi are good.",
    "Do you think Mace Windu is the most powerful Jedi?",
    "Yeah, that's good with me",
    "Glad to hear it!"
]

struct Chat {

    let name: String
    let lastText: String
    let time: String
    let muted: Bool

    func generateTextMessages(_ textMessageCount: Int) -> [TextMessage] {
        var textMessages: [TextMessage] = []
        
        for i in 0 ..< textMessageCount {
            print(i % 2 == 0)
            textMessages.append(TextMessage(text: possibleTextMessages.randomElement()!, sender: i % 2 == 0))
        }
        
        return textMessages
    }
    
}
