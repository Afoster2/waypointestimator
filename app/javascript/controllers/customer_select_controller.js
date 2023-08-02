import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "select", "info" ]

  updateInfo() {
    const selectedCustomerId = this.selectTarget.value
    fetch(`/customers/${selectedCustomerId}`)
      .then(response => response.json())
      .then(data => {
        this.infoTarget.innerHTML = data
      })
  }
}
