import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="payment"
export default class extends Controller {
  static targets = ["form"];

  connect() {
    console.log(this.formTarget);
  }

  setTodayDate() {
    const todayDate = new Date().toISOString().split("T")[0];
    this.datepickerTarget.value = todayDate;
  }
}
