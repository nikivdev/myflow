import { FromKeyParam, map, rule, simlayer, to$ as $, toKey, ToKeyParam, withMapper, withModifier, writeToProfile } from "karabiner.ts"

writeToProfile(
  "--dry-run", // prints to console
  [
    simlayer("semicolon").description('colonkey (shift)').manipulators([
      {
        tab: km('Smart Autocomplete & new line'),
        escape: km('Smart Autocomplete & new line'),
      },
      withMapper([1, 2, 3, 4, 5])((k) => map(k).to(k, '⌃')),
      withMapper([
        'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p',
        'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', '~',
        'z', 'x', 'c', 'v', 'b', 'n', 'm'
      ] as Array<FromKeyParam & ToKeyParam>)((k) => map(k).to(k, '⇧')),
    ]),

    simlayer("s").description('skey (essential)').manipulators([
      map('w').to('←', '⌥').to('→', '⌥⇧'), // Highlight word
      map('quote').to('←', '⌘').to('→', '⌘⇧'), // Highlight current line

      // Or map('e').to('⇥'),
      {
        e: toKey('tab'),
        r: toKey('tab', '⇧'),

        a: toKey('c', '⌘'), // Copy
        n: toKey('v', '⌘'), // Paste
        o: toKey('x', '⌘'), // Cut
      },

      // Or map('h', '??').to('←'),
      withModifier('optionalAny')({
        h: toKey('←'),
        j: toKey('↓'),
        k: toKey('↑'),
        l: toKey('→'),

        b: toKey('←', '⌘'),
        m: toKey('→', '⌘'),
      }),
    ]),

    rule('swap : and ;').manipulators([
      // Or map(';', '?⇪').to(';', '⇧'),
      map('semicolon', {optional: 'caps_lock'}).to('semicolon', 'shift'),
      map('semicolon', 'shift').to('semicolon')
    ]),

    simlayer("w").manipulators({
      e: km("open: Fantastical"),
    }),
  ],
  {
    "basic.to_if_alone_timeout_milliseconds": 80,
    "basic.to_if_held_down_threshold_milliseconds": 50,
    "basic.to_delayed_action_delay_milliseconds": 0,
    'basic.simultaneous_threshold_milliseconds': 30,
    "simlayer.threshold_milliseconds": 250,
  }
)

function alfred(identifier: string, bundleId: string, argument: string = "") {
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
