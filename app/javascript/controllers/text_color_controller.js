import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="text-color"
export default class extends Controller {
  static targets = ["text"]

  connect() {
    console.log('hello text controller');
  }

  changeTextColor(event) {
    const rating = this.data.get("rating");
    const textElement = this.textTarget;

    if (rating === 1) {
      textElement.classList.add("text-red");
    } else if (rating === 2) {
      textElement.classList.add("text-blue");
    } else {
      textElement.classList.add("text-green");
    }
  }
}
