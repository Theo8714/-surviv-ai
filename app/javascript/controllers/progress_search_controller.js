import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card", "button"]

  filter = []

  connect() {
  }

  searchTraiter() {
    this.setProgress("a-traiter");
    this.filterAllCards("a-traiter");
    this.filterAllButtons("a-traiter");
  }

  searchEcheance() {
    this.setProgress("avant-echeance");
    this.filterAllCards("avant-echeance");
    this.filterAllButtons("avant-echeance");
  }

  searchAmiable() {
    this.setProgress("phase-amiable");
    this.filterAllCards("phase-amiable");
    this.filterAllButtons("phase-amiable");
  }

  searchJuridique() {
    this.setProgress("juridique");
    this.filterAllCards("juridique");
    this.filterAllButtons("juridique");
  }

  filterAllCards() {
    this.cardTargets.forEach((card) => {
      const cardStatus = card.dataset.status;
      const shouldShow = this.filter.includes(cardStatus) || this.filter.length === 0;
      card.classList.toggle("d-none", !shouldShow);
    });
  }

  filterAllButtons() {
    this.buttonTargets.forEach((button) => {
      const buttonStatus = button.dataset.status;
      const shouldShow = this.filter.includes(buttonStatus);
      button.classList.toggle("btn-purple", shouldShow);
    })
  }

  setProgress(progress){
    if (this.filter.includes(progress)) {
      const index = this.filter.indexOf(progress);
      if (index !== -1) {
        this.filter.splice(index, 1);
      }
    } else {
      this.filter.push(progress);
    }
  }
}
