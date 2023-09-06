import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["togglableElement"]

  connect() {
    console.log("modal controller");
  }

  show() {
    this.togglableElementTargets.forEach(element => {
      element.classList.toggle("d-none");
    });
  }

}
