import { Controller } from "stimulus"

export default class extends Controller {
  addStandardFeature(event) {
    event.preventDefault();

    var standardFeatures = document.getElementById('standard_features');
    var newId = new Date().getTime();

    standardFeatures.insertAdjacentHTML('beforeend', `
      <div class="grid grid-cols-6 gap-4 mb-7">
        <div class="col-span-2">
          <input type="text" name="boat_model[standard_features_attributes][${newId}][name]" id="boat_model_standard_features_attributes_${newId}_name" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
        </div>
        <div class="col-span-2">
          <input type="text" name="boat_model[standard_features_attributes][${newId}][description]" id="boat_model_standard_features_attributes_${newId}_description" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
        </div>
        <div class="col-span-1">
          <input type="number" name="boat_model[standard_features_attributes][${newId}][price]" id="boat_model_standard_features_attributes_${newId}_price" class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
        </div>
        <div class="col-span-1">
          <button onclick="this.parentNode.parentNode.remove()" type="button" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">Remove</button>
        </div>
      </div>
    `);
  }
}