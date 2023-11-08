// Import the Controller class from the Stimulus library
import { Controller } from "@hotwired/stimulus"

// Define the default export of this file as a class extending Controller
export default class extends Controller {
  // Define the targets that this controller will use
  static targets = ["input", "results", "selectedCustomer"]

  // The connect method is part of the Stimulus lifecycle and is called when the controller is connected to the DOM
  connect() {
    // Add an event listener to the input target for the 'keydown' event
    this.inputTarget.addEventListener('keydown', (event) => {
      // If the pressed key is Enter, prevent the default form submission
      if (event.key === 'Enter') {
        event.preventDefault();
        // You can also call the search method here if you want to trigger the search on Enter press
        this.search();
      }
    });
  }

  // This method will be called when the user types into the input field
  search() {
    // Construct the parameters for the query
    const params = new URLSearchParams({ query: this.inputTarget.value });

    // Perform a fetch request to the search endpoint, including the query parameters
    fetch(`/customers/search?${params}`, {
      method: 'GET',
      headers: {
        'Accept': 'application/json', // Expect a JSON response
        'X-Requested-With': 'XMLHttpRequest' // This header is often necessary to be recognized as an AJAX request
      }
    })
    .then(response => {
      // Check if the response is successful
      if (response.ok) {
        // Parse the response as JSON
        return response.json();
      } else {
        // If the response is not successful, throw an error
        throw new Error("Network response was not ok.");
      }
    })
    .then(data => {
      // Update the results target with the new HTML from renderResults
      this.resultsTarget.innerHTML = this.renderResults(data);
      if (data.length > 0) {
        this.resultsTarget.classList.add('search-results--active');
      } else {
        this.resultsTarget.classList.remove('search-results--active');
      }
    })
    .catch(error => {
      // Log any errors to the console
      console.error("There was a problem with the fetch operation:", error);
    });
  }

  // This method takes the data from the fetch request and builds HTML for each result
  renderResults(data) {
    return data.map(customer => `
      <div data-action="click->search#select"
           data-id="${customer.id}"
           data-name="${customer.first_name} ${customer.last_name}"
           data-email="${customer.email}"
           data-phone="${customer.phone}"
           data-address="${customer.address}"
           data-address2="${customer.address2}"
           data-city="${customer.city}"
           data-state="${customer.state}"
           data-zip="${customer.zip}"
           class="search-result-item">
        <strong>${customer.first_name} ${customer.last_name}</strong>
        <span>${customer.email}</span><br>
        <span>${customer.address}</span>
        <span>${customer.address2 ? `, ${customer.address2}` : ''}<br>
        <span>${customer.city}, ${customer.state} ${customer.zip}</span>
      </div>
    `).join("");
  }

  // This method is called when the user clicks on one of the search results
  select(event) {
    // Get the id of the selected customer from the data-id attribute
    const id = event.currentTarget.dataset.id
    const customerName = event.currentTarget.dataset.name;
    const customerEmail = event.currentTarget.dataset.email;
    const customerAddress = event.currentTarget.dataset.address;
    const customerAddress2 = event.currentTarget.dataset.address2;
    const customerCity = event.currentTarget.dataset.city;
    const customerState = event.currentTarget.dataset.state;
    const customerZip = event.currentTarget.dataset.zip;
    const customerPhone = event.currentTarget.dataset.phone;

    // Clear any existing content in the selected customer info target
    this.selectedCustomerTarget.innerHTML = ''; // <-- Add this line to clear previous content

    // Set the values in the input fields
    this.inputTarget.value = customerName;
    document.getElementById("estimate_customer_id").value = id;

    // Update the selected customer info
    this.selectedCustomerTarget.innerHTML = `
      <strong>${customerName}</strong><br>
      <span>${customerEmail}</span><br>
      <span>${customerPhone}</span><br>
      <span>${customerAddress}</span>
      <span>${customerAddress2 ? `, ${customerAddress2}` : ''}<br>
      <span>${customerCity}, ${customerState} ${customerZip}</span>
    `;

    console.log("Clearing results");
    this.resultsTarget.innerHTML = "";
    this.resultsTarget.classList.remove('search-results--active');
  }
}
