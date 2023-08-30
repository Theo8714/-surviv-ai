import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card"]

  filter = []

  connect() {
  }

  searchTraiter() {
    if (this.filter.includes("a-traiter")) {
      const index = this.filter.indexOf("a-traiter");
      if (index !== -1) {
        this.filter.splice(index, 1);
      }
    } else {
      this.filter.push("a-traiter");
    }
    this.filterAllCards("a-traiter")
  }

  searchEcheance() {
    if (this.filter.includes("avant-echeance")) {
      const index = this.filter.indexOf("avant-echeance");
      if (index !== -1) {
        this.filter.splice(index, 1);
      }
    } else {
      this.filter.push("avant-echeance");
    }
    this.filterAllCards("avant-echeance")
  }

  searchAmiable() {
    if (this.filter.includes("phase-amiable")) {
      const index = this.filter.indexOf("phase-amiable");
      if (index !== -1) {
        this.filter.splice(index, 1);
      }
    } else {
      this.filter.push("phase-amiable");
    }
    this.filterAllCards("phase-amiable")
  }

  searchJuridique() {
    if (this.filter.includes("juridique")) {
      const index = this.filter.indexOf("juridique");
      if (index !== -1) {
        this.filter.splice(index, 1);
      }
    } else {
      this.filter.push("juridique");
    }
    this.filterAllCards("juridique")
  }

  filterAllCards(status) {
    this.cardTargets.forEach((card) => {
      const cardStatus = card.dataset.status;
      if (this.filter.includes(status)) {
        card.classList.remove("d-none");
      } else {
        card.classList.add("d-none");
      }
    });
  }
}
