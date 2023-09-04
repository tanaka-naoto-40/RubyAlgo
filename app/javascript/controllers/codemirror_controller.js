import { Controller } from "@hotwired/stimulus"
import { EditorView, basicSetup } from "codemirror"
import { json } from "@codemirror/lang-json"
import {StreamLanguage} from "@codemirror/language"
import {ruby} from "@codemirror/legacy-modes/mode/ruby"



export default class extends Controller {
  static targets = ["editor", "input"]
  static values = {
    doc: String
  }

  connect() {
    this.editor = new EditorView({
      doc: this.docValue,
      extensions: [
        basicSetup,
        StreamLanguage.define(ruby),
        json(),
        EditorView.updateListener.of((view) => {
          if (view.docChanged) { this.sync() }
        })
      ],
      parent: this.editorTarget
    })
  }

  //ページ移動時（DOMから切断されたとき）などにキャッシュの削除
  disconnect() {
    this.editor.destroy()
  }

  sync() {
    this.inputTarget.value = this.editor.state.doc.toString()
  }
}
