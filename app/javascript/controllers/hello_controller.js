import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
 static targets = [ "name", "output" ]

  connect() {
    this.element.dataset.controllerConnected = true;
    // this.element.textContent = "Hello World!"
  }

  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}
