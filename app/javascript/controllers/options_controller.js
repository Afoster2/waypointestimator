import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["boatModelId", "standard_features", "power_options", "console_options", "factory_options", "gauge_upgrades", "seating_options", "aluminum_options", "lighting_options", "finishing_options", "cooler_options", "wetsound_packages", "additional_options", "trailer_upgrades"];

  async loadBoatModelOptions() {
    console.log("standard_featuresTarget:", this.standard_featuresTarget);
    console.log("power_optionsTarget:", this.power_optionsTarget);
    const selectedBoatModelId = this.boatModelIdTarget.value;
    const url = `/boat_models/${selectedBoatModelId}/options.json`;

    try {
      const response = await fetch(url);
      const data = await response.json();
      console.log(this.standard_featuresTarget);

      // Clear existing options for each target
      this.standard_featuresTarget.innerHTML = "";
      this.power_optionsTarget.innerHTML = "";
      this.console_optionsTarget.innerHTML = "";
      this.factory_optionsTarget.innerHTML = "";
      this.gauge_upgradesTarget.innerHTML = "";
      this.seating_optionsTarget.innerHTML = "";
      this.aluminum_optionsTarget.innerHTML = "";
      this.lighting_optionsTarget.innerHTML = "";
      this.finishing_optionsTarget.innerHTML = "";
      this.cooler_optionsTarget.innerHTML = "";
      this.wetsound_packagesTarget.innerHTML = "";
      this.additional_optionsTarget.innerHTML = "";
      this.trailer_upgradesTarget.innerHTML = "";

      // Modified generateCheckboxes function
      const generateCheckboxes = (optionsArray, optionType, targetElement) => {
        optionsArray.forEach(option => {
            const checkbox = document.createElement('input');
            checkbox.type = 'checkbox';
            checkbox.name = `${optionType}[]`;
            checkbox.value = option.id;
            checkbox.id = `${optionType}_${option.id}`;
            
            const label = document.createElement('label');
            label.htmlFor = checkbox.id;
            label.textContent = option.name;
            
            const description = document.createElement('p');
            description.textContent = option.description;

            const price = document.createElement('p');
            price.textContent = `Price: $${option.price}`;

            targetElement.append(checkbox, label, description, price, document.createElement('br'));
        });
      };

      // Load each type of option
      generateCheckboxes(data.standard_features, 'standard_features', this.standard_featuresTarget);
      generateCheckboxes(data.power_options, 'power_options', this.power_optionsTarget);
      generateCheckboxes(data.console_options, 'console_options', this.console_optionsTarget);
      generateCheckboxes(data.factory_options, 'factory_options', this.factory_optionsTarget);
      generateCheckboxes(data.gauge_upgrades, 'gauge_upgrades', this.gauge_upgradesTarget);
      generateCheckboxes(data.seating_options, 'seating_options', this.seating_optionsTarget);
      generateCheckboxes(data.aluminum_options, 'aluminum_options', this.aluminum_optionsTarget);
      generateCheckboxes(data.lighting_options, 'lighting_options', this.lighting_optionsTarget);
      generateCheckboxes(data.finishing_options, 'finishing_options', this.finishing_optionsTarget);
      generateCheckboxes(data.cooler_options, 'cooler_options', this.cooler_optionsTarget);
      generateCheckboxes(data.wetsound_packages, 'wetsound_packages', this.wetsound_packagesTarget);
      generateCheckboxes(data.additional_options, 'additional_options', this.additional_optionsTarget);
      generateCheckboxes(data.trailer_upgrades, 'trailer_upgrades', this.trailer_upgradesTarget);

    } catch (error) {
      console.error('Error fetching boat model options:', error);
    }
  }
}
