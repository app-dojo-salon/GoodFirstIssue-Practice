import Foundation

var message = "GoodFirstIssueの練習用レポジトリです"

print(message)
print("----------------------")

func echigoSeika(completion: @escaping () -> Void) {
    print("👧「正解は......」")
    let num = Int.random(in: 0...1)
    if num == 0 {
        print("🐱「にゃ〜ん」")
    } else {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            completion()
        }
    }
}

echigoSeika(completion:) {
    print("👴「越後製菓ァァ」")
}
