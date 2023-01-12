import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
 static targets = [ "name", "output" ]

  connect() {
    // this.element.textContent = "Hello World!"
    console.log('Hello World hello_controller.js');
  }

  greet() {
    console.log('greet');
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
