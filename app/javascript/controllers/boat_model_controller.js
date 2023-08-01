import { Controller } from "stimulus"

export default class extends Controller {
  addStandardFeature(event) {
    this.addFeature(event, 'standard_features');
  }

  addPowerOption(event) {
    event.preventDefault();

    var powerOptions = document.getElementById('power_options');
    var newId = new Date().getTime();

    powerOptions.insertAdjacentHTML('beforeend', `
      <div class="grid grid-cols-6 gap-4">
        <div class="col-span-1">
          <label for="boat_model_power_options_attributes_${newId}_brand">Brand</label>
          <input type="text" name="boat_model[power_options_attributes][${newId}][brand]" id="boat_model_power_options_attributes_${newId}_brand" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
        </div>
        <div class="col-span-1">
          <label for="boat_model_power_options_attributes_${newId}_model_number">Model Number</label>
          <input type="text" name="boat_model[power_options_attributes][${newId}][model_number]" id="boat_model_power_options_attributes_${newId}_model_number" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
        </div>
        <div class="col-span-2">
          <label for="boat_model_power_options_attributes_${newId}_description">Description</label>
          <input type="text" name="boat_model[power_options_attributes][${newId}][description]" id="boat_model_power_options_attributes_${newId}_description" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
        </div>
        <div class="col-span-1">
          <label for="boat_model_power_options_attributes_${newId}_price">Price</label>
          <input type="number" name="boat_model[power_options_attributes][${newId}][price]" id="boat_model_power_options_attributes_${newId}_price" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
        </div>
        <div class="col-span-1">
          <button onclick="this.parentNode.parentNode.remove()" type="button" class="my-7 bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">Remove</button>
        </div>
      </div>
    `);
  }

  addConsoleOption(event) {
    this.addFeature(event, 'console_options');
  }

  addFactoryOption(event) {
    this.addFeature(event, 'factory_options');
  }

  addGaugeUpgrade(event) {
    this.addFeature(event, 'gauge_upgrades');
  }

  addSeatingOption(event) {
    this.addFeature(event, 'seating_options');
  }

  addAluminumOption(event) {
    this.addFeature(event, 'aluminum_options');
  }

  addLightingOption(event) {
    this.addFeature(event, 'lighting_options');
  }

  addFinishingOption(event) {
    this.addFeature(event, 'finishing_options');
  }

  addCoolerOption(event) {
    this.addFeature(event, 'cooler_options');
  }

  addWetsoundPackage(event) {
    this.addFeature(event, 'wetsound_packages');
  }

  addAdditionalOption(event) {
    this.addFeature(event, 'additional_options');
  }

  addTrailerUpgrade(event) {
    this.addFeature(event, 'trailer_upgrades');
  }

  addFeature(event, featureType) {
    event.preventDefault();

    var features = document.getElementById(featureType);
    var newId = new Date().getTime();

    features.insertAdjacentHTML('beforeend', `
      <div class="grid grid-cols-6 gap-4">
        <div class="col-span-2">
          <label for="boat_model_${featureType}_attributes_${newId}_name">Name</label>
          <input type="text" name="boat_model[${featureType}_attributes][${newId}][name]" id="boat_model_${featureType}_attributes_${newId}_name" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
        </div>
        <div class="col-span-2">
          <label for="boat_model_${featureType}_attributes_${newId}_description">Description</label>
          <input type="text" name="boat_model[${featureType}_attributes][${newId}][description]" id="boat_model_${featureType}_attributes_${newId}_description" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
        </div>
        <div class="col-span-1">
          <label for="boat_model_${featureType}_attributes_${newId}_price">Price</label>
          <input type="number" name="boat_model[${featureType}_attributes][${newId}][price]" id="boat_model_${featureType}_attributes_${newId}_price" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
        </div>
        <div class="col-span-1">
          <button onclick="this.parentNode.parentNode.remove()" type="button" class="my-7 bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">Remove</button>
        </div>
      </div>
    `);
  }
}
