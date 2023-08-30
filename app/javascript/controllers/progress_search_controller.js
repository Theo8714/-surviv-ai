import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card"]

  connect() {
    this.filters = []
  }

  searchTraiter() {
    // ajouter le statut cliqué dans l'array this.filter ou l'enlever si présent
    // jouer la methode filterAllCards
    this.filterCards("a-traiter");
  }

  searchEcheance() {
    this.filterCards("avant-echeance");
  }

  searchAmiable() {
    this.filterCards("phase-amiable");
  }

  searchJuridique() {
    this.filterCards("juridique");
  }

  filterAllCards() {
    // forEach card
    // vérifier si cardStatus === un élément de l'array this.filter
    // si c'est le cas class remove d.none
    // sinon add d-none
  }

  filterCards(status) {
    this.cardTargets.forEach((card) => {
      const cardStatus = card.dataset.status;
      console.log(cardStatus === status || status === "Tous");
      console.log(cardStatus);
      console.log(status);
      if (cardStatus === status ) {
        card.classList.remove("d-none");
      } else {
        card.classList.add("d-none");
      }
    });
  }
}
