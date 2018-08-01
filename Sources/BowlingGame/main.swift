import BowlingGameCore

let tool = BowlingGameCore()

do {
  try tool.run()
}
catch {
  print("Whoops! I could not run the tool!")
}
