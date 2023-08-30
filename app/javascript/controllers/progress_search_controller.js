import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress-search"
export default class extends Controller {
  static targets = ["progress"]

  connect() {
  }

  searchTraiter() {
    console.log("a traiter");
  }

  searchEcheance() {
    console.log("echeance");
  }

  searchAmiable() {
    console.log("amiable");
  }

  searchJuridique() {
    console.log("juridique");
  }
}
