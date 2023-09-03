import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
  }

}

$('#exampleModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
