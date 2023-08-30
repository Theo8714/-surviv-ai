import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card", "button"]

  filter = []

  connect() {
  }

  searchTraiter() {
    this.setProgress("a-traiter")
    this.filterAllCards("a-traiter");
  }

  searchEcheance() {
    this.setProgress("avant-echeance")
    this.filterAllCards("avant-echeance")
  }

  searchAmiable() {
    this.setProgress("phase-amiable")
    this.filterAllCards("phase-amiable")
  }

  searchJuridique() {
    this.setProgress("juridique")
    this.filterAllCards("juridique")
  }

  filterAllCards(status) {
    this.cardTargets.forEach((card) => {
      const cardStatus = card.dataset.status;
      const shouldShow = this.filter.includes(cardStatus) || this.filter.length === 0;
      card.classList.toggle("d-none", !shouldShow);
    });
  }

  setProgress(progress){
    if (this.filter.includes(progress)) {
      const index = this.filter.indexOf(progress);
      if (index !== -1) {
        this.filter.splice(index, 1);
        this.buttonTarget.classList.remove("btn-succes");
        this.buttonTarget.classList.add("btn-blue");
      }
    } else {
      this.filter.push(progress);
      this.buttonTarget.classList.remove("btn-blue");
      this.buttonTarget.classList.add("btn-success");
    }
  }
}
