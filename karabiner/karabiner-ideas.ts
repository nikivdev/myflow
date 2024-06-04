// TODO: WIP idea to replace https://github.com/yqrashawn/GokuRakuJoudo
// goal is to have autocomplete on KM/Alfred calls
// and make editing even faster than .edn
// allow sharing of config between users nicely

// TODO: maybe even allow calling into shell directly nicely
// without going through KM
// same for maybe doing fetch requests, processing it without KM
// just call a function! handle errors nicely abstracted by fetch call (with effect)

// TODO: solve problem with clashes on keys. i.e. in system settings > keyboard > shortcuts (I bind many keys to odd keys, I need fast way to know what's taken and what's not)

// type KMMacros = "open: Safari" | "open: Cursor"
export type KMMacros = "open: Safari" | "open: Cursor"
function km(macroName: KMMacros) {
  return
}

type AlfredWorkflow = "Searchio: search google"
function alfred(workflow: AlfredWorkflow) {
  return
}

function shell(cmd: string) {}

function karabinerConfig() {
  return {
    keysTogether: {
      // TODO: scan alfred directory
      // `Searchio` is name of workflow
      // `search google` is id of external trigger
      "j,k": alfred("Searchio: search google"),
    },
    layers: {
      a: {
        // bind all from q to p to shift+key
        "q..p": "shift",
        // bind `3` to shift+3
        3: "shift",
        // TODO: scan KM macros
        // `open: safari` is name of macro
        space: km("open: Safari"),
        // TODO: maybe include the KM group in the function call optionally
        comma: km("open: Safari"),
      },
      w: {
        q: shell("ls.."),
      },
    },
  }
}

karabinerConfig()
