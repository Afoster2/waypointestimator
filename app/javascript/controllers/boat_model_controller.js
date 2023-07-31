import { Controller } from "stimulus"

export default class extends Controller {
  addStandardFeature(event) {
    event.preventDefault();

    var standardFeatures = document.getElementById('standard_features');
    var newId = new Date().getTime();

    standardFeatures.insertAdjacentHTML('beforeend', `
      <div class="field">
        <label for="boat_model_standard_features_attributes_${newId}_name">Name</label>
        <input type="text" name="boat_model[standard_features_attributes][${newId}][name]" id="boat_model_standard_features_attributes_${newId}_name">
      </div>
      <div class="field">
        <label for="boat_model_standard_features_attributes_${newId}_description">Description</label>
        <textarea name="boat_model[standard_features_attributes][${newId}][description]" id="boat_model_standard_features_attributes_${newId}_description"></textarea>
      </div>
      <div class="field">
        <label for="boat_model_standard_features_attributes_${newId}_price">Price</label>
        <input type="number" name="boat_model[standard_features_attributes][${newId}][price]" id="boat_model_standard_features_attributes_${newId}_price">
      </div>
      <div class="field">
        <input type="checkbox" name="boat_model[standard_features_attributes][${newId}][_destroy]" id="boat_model_standard_features_attributes_${newId}__destroy">
        <label for="boat_model_standard_features_attributes_${newId}__destroy">Remove this feature</label>
      </div>
    `);
  }
}
