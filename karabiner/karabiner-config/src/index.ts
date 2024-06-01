import { simlayer, to$, writeToProfile } from "karabiner.ts"
const $ = to$

writeToProfile(
  // "--dry-run", // prints to console
  "karabiner.ts", // adds it to karabiner.ts profile
  [
    simlayer("w").manipulators({
      e: km("open: Fantastical"),
    }),
  ],
  {
    "basic.to_if_alone_timeout_milliseconds": 80,
    "basic.to_if_held_down_threshold_milliseconds": 50,
    "basic.to_delayed_action_delay_milliseconds": 0,
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
