import { Controller } from "stimulus"
import $ from 'jquery';
import 'select2';

export default class extends Controller {
  static targets = ["boatModelSelect", "options", "customerSelect"]

  connect() {
    this.boatModelSelectTarget.addEventListener("change", this.updateOptions.bind(this))
    $(this.customerSelectTarget).select2();
  }

  updateOptions() {
    let boatModelId = this.boatModelSelectTarget.value
    fetch(`/boat_models/${boatModelId}/options`)
      .then(response => response.text())
      .then(html => {
        this.optionsTarget.innerHTML = html
      })
  }
}
