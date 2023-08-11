import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["options"];
  static values = { url: String };

  async loadBoatModelOptions() {
    const boatModelId = this.boatModelIdValue;
    const url = `/boat_models/${boatModelId}.json`;

    // Assuming 'options' is an array of option objects with 'id' and 'name' properties.
    const optionsHTML = data.options.map(option => `<option value="${option.id}">${option.name}</option>`).join("");
    this.optionsTarget.innerHTML = optionsHTML;
  }
}