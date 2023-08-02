import { Controller } from "stimulus"
import $ from "jquery";
import select2 from "select2";


export default class extends Controller {
  static targets = [ "customerSelect", "boatModelSelect" ]

  connect() {
    $(this.customerSelectTarget).select2()
    $(this.boatModelSelectTarget).select2()
  }
}
