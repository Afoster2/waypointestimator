import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "info" ]

  updateInfo(event) {
    const customerId = event.target.value

    fetch(`/customers/${customerId}.json`)
      .then(response => response.json())
      .then(data => {
        this.infoTarget.innerHTML = `
          <h6 class="font-bold uppercase">${data.first_name} ${data.last_name}</h6>
          <h6>${data.address}, ${data.city}, ${data.state} ${data.zip}</h6>
          <h6>${data.email}<br/>${data.phone}</h6>
        `
      })
  }
}
