
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  connect() {
    console.log("Hello from toggle_controller.js");
  }
  static targets = ["togglableElement", "togglableElem", "toggableClass", "toggableCl"]

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
    this.togglableElemTarget.classList.toggle("d-none");
    this.toggableClassTarget.classList.toggle("clicked");
    this.toggableClTarget.classList.toggle("clicked");
  }

};
