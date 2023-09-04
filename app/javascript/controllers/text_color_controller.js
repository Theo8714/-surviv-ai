import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["text"]

  connect() {
    const rating = this.data.get("rating");
    const textElement = this.textTarget;
console.log(rating);
    if (rating === "1") {
      textElement.classList.add("text-green");
    } else if (rating === "2") {
      textElement.classList.add("text-blue");
    } else {
      textElement.classList.add("text-warning");
    }
  }
}
