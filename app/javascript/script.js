window.editor = null;

"use strict";

let editor;

window.addEventListener("DOMContentLoaded", event => {
  editor.setOption("extraKeys", {
    "Tab": function(cm) {
      if (cm.somethingSelected()) cm.indentSelection("add");
      else cm.replaceSelection(Array(cm.getOption("indentUnit") + 1).join(" "), "end", "+input");
    },
    "Shift-Tab": function(cm) {
      cm.execCommand("indentLess");
    },
    "Ctrl-Enter": function(cm) {
      BatchCodeTest.run();
    }
  });

  document.getElementById("run").disabled = true;
});
