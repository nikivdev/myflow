// TODO: WIP idea to replace https://github.com/yqrashawn/GokuRakuJoudo
// goal is to have autocomplete on KM/Alfred calls
// and make editing even faster than .edn
// allow sharing of config between users nicely

type KMMacros = "open: Safari" | "open: Cursor";
function km(macroName: KMMacros) {
  return;
}

type AlfredWorkflow = "Searchio: search google";
function alfred(workflow: AlfredWorkflow) {
  return;
}

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
    },
  };
}
