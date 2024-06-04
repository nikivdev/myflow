import {
  ifVar,
  map,
  mapSimultaneous,
  rule,
  simlayer,
  to$ as $,
  toKey,
  toTypeSequence,
  withCondition,
  withMapper,
  withModifier,
  writeToProfile,
} from "karabiner.ts"

const leftSideNums = [1, 2, 3, 4, 5] as const
const rightSideNums = [6, 7, 8, 9, 0] as const
const numbers = [...leftSideNums, ...rightSideNums] as const
const letters = [
  ...["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
  ...["a", "s", "d", "f", "g", "h", "j", "k", "l"],
  ...["z", "x", "c", "v", "b", "n", "m"],
] as const
const symbols = ["[", "]", ";", "'", ",", ".", "/"] as const
const lettersAndSymbols = [...letters, ...symbols] as const
const allKeys = [...numbers, ...letters, ...symbols] as const

const dash = {
  python: open('"dash://.python:"'),
  ts: openInBackground(
    '"dash-plugin://query=.tsprofile%3A&prevent_activation=true"'
  ),
  rust: openInBackground(
    '"dash-plugin://query=.tsprofile%3A&prevent_activation=true"'
  ),
  swift: open('"dash-plugin://query=.swiftprofile%3A&prevent_activation=true"'),
  go: open('"dash-plugin://query=.goprofile%3A&prevent_activation=true"'),
}

writeToProfile(
  // "--dry-run",
  "karabiner.ts",
  [
    // colonkey (shift)
    simlayer("semicolon").manipulators([
      {
        tab: km("Smart Autocomplete & new line"),
        escape: km("Smart Autocomplete & new line"),
      },
      withMapper(leftSideNums)((k) => map(k).to(k, "⌃")),
      withMapper([...letters, "`"])((k) => map(k).to(k, "⇧")),
    ]),

    // qkey (cmd + shift)
    simlayer("q").manipulators([
      withMapper([3, 4, ...rightSideNums, ...lettersAndSymbols])((k) =>
        map(k).to(k, "⌘⇧")
      ),
      map("␣").to("e", "⌘⌥⇧"), // Selection -> YouTube
    ]),

    // ekey (cmd)
    simlayer("e").manipulators([
      withMapper(allKeys)((k) => map(k).to(k, "⌘")),
      { "␣": km("Explain selected text with ChatGPT") },
    ]),

    // akey (ctrl)
    simlayer("a").manipulators([
      withMapper(allKeys)((k) => map(k).to(k, "⌃")),
      map("␣").to(9, "⌘⌃"), // Selection -> Google
    ]),

    // skey (essential)
    simlayer("s").manipulators([
      map("w").to("←", "⌥").to("→", "⌥⇧"), // Highlight word
      map("quote").to("←", "⌘").to("→", "⌘⇧"), // Highlight current line

      // Or map('e').to('⇥'),
      {
        e: toKey("tab"),
        r: toKey("tab", "⇧"),

        a: toKey("c", "⌘"), // Copy
        n: toKey("v", "⌘"), // Paste
        o: toKey("x", "⌘"), // Cut
      },

      // Or map('h', '??').to('←'),
      withModifier("optionalAny")({
        h: toKey("←"),
        j: toKey("↓"),
        k: toKey("↑"),
        l: toKey("→"),

        b: toKey("←", "⌘"),
        m: toKey("→", "⌘"),
      }),
    ]),

    rule("swap : and ;").manipulators([
      // Or map(';', '?⇪').to(';', '⇧'),
      map("semicolon", { optional: "caps_lock" }).to("semicolon", "shift"),
      map("semicolon", "shift").to("semicolon"),
    ]),

    rule("jsim").manipulators([
      mapSimultaneous(["j", "k"]).to(
        alfred("search google", "net.deanishe.alfred-searchio")
      ),
      mapSimultaneous(["j", ";"]).to(9, "⌘⌥⇧"), // Raycast
      mapSimultaneous(["j", "l"]).to("␣", "Hyper"), // Raycast
    ]),

    rule("ksim").manipulators([
      mapSimultaneous(["k", "l"]).to(
        alfred("search dash", "com.kapeli.dash.workflow")
      ),
    ]),

    simlayer("w").manipulators({
      e: km("open: Fantastical"),
    }),

    // dkey (mouse)
    simlayer("d").manipulators([
      map("i").to("keypad_hyphen", "⌘"), // Zoom out
      map("o").to("keypad_plus", "⌘"), // Zoom in
      map("a").to("c", "⌘").to("tab", "⌘"), // Copy & activate previous app
      map("j").toMouseKey({ vertical_wheel: 60 }), // Scroll down
      map("k").toMouseKey({ vertical_wheel: -60 }), // Scroll down
      map("z").toPointingButton("button2"), // Right click
      map("v").toPointingButton("button1"), // Left click
      map("b").toPointingButton("button3"), // Middle click
    ]),

    // tabkey (things)
    simlayer("tab").manipulators([
      map("i").toVar("in-lang", "python").to(dash.python),
      map("j").toVar("in-lang", "ts").to(dash.ts),
      map("k").toVar("in-lang", "rust").to(dash.rust),
      map(";").toVar("in-lang", "go").to(dash.go),
    ]),

    simlayer("period").manipulators([
      withCondition(ifVar("in-lang", "ts"))({
        a: toTypeSequence("console.log()←"),
        s: toTypeSequence("=>␣"),
      }),
      withCondition(ifVar("in-lang", "go"))({
        tab: km("w: GoDoc"),
        a: toTypeSequence("fmt.Println()←"),
      }),
      withCondition(ifVar("in-lang", "python"))({
        a: toTypeSequence("print()←"),
      }),
      withCondition(ifVar("in-lang", "swift"))({
        a: toTypeSequence("print()←"),
      }),
      withCondition(ifVar("in-lang", "rust"))({
        a: toTypeSequence("log!()←"),
      }),
    ]),
  ],
  {
    "basic.to_if_alone_timeout_milliseconds": 80,
    "basic.to_if_held_down_threshold_milliseconds": 50,
    "basic.to_delayed_action_delay_milliseconds": 0,
    "basic.simultaneous_threshold_milliseconds": 30,
    "simlayer.threshold_milliseconds": 250,
  }
)

function alfred(identifier: string, bundleId: string, argument = "") {
  return $(
    `osascript -e 'tell application id "com.runningwithcrayons.Alfred" to run trigger "${identifier}" in workflow "${bundleId}" with argument "${argument}"'`
  )
}

function km(macroName: string) {
  return $(
    `osascript -e 'tell application "Keyboard Maestro Engine" to do script "${macroName}"'`
  )
}

// TODO: https://github.com/evan-liu/karabiner-config/blob/main/src/apps/raycast.ts (better types)
function raycast(extension: string) {
  return $(`open "raycast://extensions/raycast/${extension}"`)
}

function open(arg: string) {
  return $(`open ${arg}`)
}

function openInBackground(arg: string) {
  return $(`open -g ${arg}`)
}
