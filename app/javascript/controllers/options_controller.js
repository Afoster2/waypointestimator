import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "options" ]

  load(event) {
    const boatModelId = event.target.value
    const url = `/boat_models/${boatModelId}/options`

    fetch(url)
      .then(response => response.text())
      .then(html => {
        this.optionsTarget.innerHTML = html
      })
  }
}
