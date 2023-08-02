import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["boatModelSelect", "options"]

  connect() {
    this.boatModelSelectTarget.addEventListener("change", this.updateOptions.bind(this))
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
