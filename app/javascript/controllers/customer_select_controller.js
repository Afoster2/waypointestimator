import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["first_name", "last_name", "address", "city", "state", "zip", "email", "phone", "customerSelect"];
  static values = { url: String };

  async loadCustomerInfo() {
    const customerId = this.customerSelectTarget.value;
    console.log("Selected Customer ID:", customerId);

    const urlTemplate = this.customerSelectTarget.dataset.url; // Using dataset.url to access the data-url attribute
    console.log("URL Template:", urlTemplate);

    if (!urlTemplate) {
        console.error("URL template is not defined!");
        return;
    }

    const url = urlTemplate.replace(":id", customerId) + ".json";
    console.log("Constructed URL:", url);


    try {
      const response = await fetch(url);
      if (!response.ok) {
        throw new Error('Failed to fetch customer information.');
      }
      const data = await response.json();

      this.first_nameTarget.textContent = data.first_name;
      this.last_nameTarget.textContent = data.last_name;
      this.addressTarget.textContent = data.address;
      this.cityTarget.textContent = data.city;
      this.stateTarget.textContent = data.state;
      this.zipTarget.textContent = data.zip;
      this.emailTarget.textContent = data.email;
      this.phoneTarget.textContent = data.phone;
    } catch (error) {
      console.error(error);
      this.full_nameTarget.textContent = 'Error fetching customer information.';
    }
  }

}
