import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["info"];
  static values = { url: String };

  async loadCustomerInfo() {
    const customerId = this.element.value;
    try {
      const response = await fetch(`/customers/${customerId}.json`);
      if (!response.ok) {
        throw new Error('Failed to fetch customer information.');
      }
      const data = await response.json();

      const customerInfoHTML = `
        <h6 class="font-bold uppercase">${data.full_name}</h6>
        <h6>${data.address}, ${data.city}, ${data.state} ${data.zip}</h6>
        = mail_to ${data.email}
        = number_to_phone(${data.phone})
      `;
      this.infoTarget.innerHTML = customerInfoHTML;
    } catch (error) {
      console.error(error);
      this.infoTarget.innerHTML = '<p>Error fetching customer information.</p>';
    }
  }
}
