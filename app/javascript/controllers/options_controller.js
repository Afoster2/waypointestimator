import { Controller } from "stimulus"
import $ from "jquery";


export default class extends Controller {
  static targets = [ "customerSelect", "boatModelSelect" ]

  connect() {
    $(this.customerSelectTarget).select2()
    $(this.boatModelSelectTarget).select2()
  }
}
