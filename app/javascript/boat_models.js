document.addEventListener('DOMContentLoaded', function() {
  document.addEventListener('addStandardFeature', function(e) {
    e.preventDefault();

    var standardFeatures = document.getElementById('standard_features');
    var newId = new Date().getTime();
    var regexp = new RegExp('new_standard_features', 'g');

    standardFeatures.insertAdjacentHTML('beforeend', `
    .grid.grid-cols-6.gap-4
      .col-span-2
        %label.block.text-sm.font-medium.text-gray-700{:for => "boat_model_standard_features_attributes_${newId}_name"} Name
        %input.mt-1.focus:ring-indigo-500.focus:border-indigo-500.block.w-full.shadow-sm.sm:text-sm.border-gray-300.rounded-md{:id => "boat_model_standard_features_attributes_${newId}_name", :name => "boat_model[standard_features_attributes][${newId}][name]", :type => "text"}/
      .col-span-3
        %label.block.text-sm.font-medium.text-gray-700{:for => "boat_model_standard_features_attributes_${newId}_description"} Description
        %input.mt-1.focus:ring-indigo-500.focus:border-indigo-500.block.w-full.shadow-sm.sm:text-sm.border-gray-300.rounded-md{:id => "boat_model_standard_features_attributes_${newId}_description", :name => "boat_model[standard_features_attributes][${newId}][description]"}
      .col-span-2
        %label.block.text-sm.font-medium.text-gray-700{:for => "boat_model_standard_features_attributes_${newId}_price"} Price
        %input.mt-1.focus:ring-indigo-500.focus:border-indigo-500.block.w-full.shadow-sm.sm:text-sm.border-gray-300.rounded-md{:id => "boat_model_standard_features_attributes_${newId}_price", :name => "boat_model[standard_features_attributes][${newId}][price]", :type => "number"}/
      .col-span-1
        %input.focus:ring-indigo-500.h-4.w-4.text-indigo-600.border-gray-300.rounded{:id => "boat_model_standard_features_attributes_${newId}__destroy", :name => "boat_model[standard_features_attributes][${newId}][_destroy]", :type => "checkbox"}/
        %label.ml-2.block.text-sm.text-gray-900{:for => "boat_model_standard_features_attributes_${newId}__destroy"} Remove this feature

    `);
  });
});
