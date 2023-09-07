import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loading"
export default class extends Controller {
  connect() {
    console.log("hello load");
  }

  loadmodal() {
    $('#modal-loading').modal('show');
  }
}
