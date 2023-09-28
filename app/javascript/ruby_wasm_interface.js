let RubyModule;
const { DefaultRubyVM } = window["ruby-wasm-wasi"];
window.main = async function main() {
  const response = await fetch(
    "https://cdn.jsdelivr.net/npm/ruby-head-wasm-wasi@0.3.0-2022-09-29-a/dist/ruby+stdlib.wasm"
  );
  const buffer = await response.arrayBuffer();
  const module = await WebAssembly.compile(buffer);
  RubyModule = module;
  
  if (!window.editor) {
    editor = CodeMirror.fromTextArea(document.getElementById("txt-editor"), {
      lineNumbers: true,
      mode: "ruby",
      indentUnit: 2,
    });
  }

  const runButton = document.getElementById("run");
  runButton.disabled = false;
  runButton.innerText = "▶コード実行";
  runButton.onclick = function() {
    runButton.disabled = true;
    runButton.innerText = "実行中";
    setTimeout(run, 20);
  };
};
main();

window.run = async function run(){
  const script = editor.getValue();
  const outputTextarea = document.getElementById("output");
  const { vm } = await DefaultRubyVM(RubyModule);
  outputTextarea.value = "";

  vm.eval(`
require "stringio"
require "js"
$stdout = $stderr = StringIO.new(+"", "w")
module Kernel
def gets
JS::eval("return prompt()").to_s + "\n"
end
end
  `);
  let output;
  try {
    vm.eval(script);
    output = vm.eval(`$stdout.string`).toString();
  } catch(err) {
    output = err.toString();
  }

  outputTextarea.value += output;
  const runButton = document.getElementById("run");
  runButton.disabled = false;
  runButton.innerText = "▶コード実行";
}


