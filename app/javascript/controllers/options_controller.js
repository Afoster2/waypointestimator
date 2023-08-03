import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["options"];
  static values = { url: String };

  async loadBoatModelOptions() {
    const boatModelId = this.element.value;
    const response = await fetch(`${this.urlValue}/${boatModelId}`);
    const data = await response.json();

    // Assuming 'options' is an array of option objects with 'id' and 'name' properties.
    const optionsHTML = data.options.map(option => `<option value="${option.id}">${option.name}</option>`).join("");
    this.optionsTarget.innerHTML = optionsHTML;
  }
}
