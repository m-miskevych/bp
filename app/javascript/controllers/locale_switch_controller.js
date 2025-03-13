import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="locale-switch"
export default class extends Controller {
  static targets = ["localeInput"];

  changeLocale(event) {
    let selectedLocale = event.target.value;

    this.localeInputTargets.forEach((element) => {
      if (element.dataset.locale === selectedLocale) {
        element.classList.remove("hidden");
      } else {
        element.classList.add("hidden");
      }
    });
  }
}
