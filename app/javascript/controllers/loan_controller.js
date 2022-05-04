import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  formSubmit(){
      let balance = this.targets.find("balance").value
      let periods = this.targets.find("periods").value
      let rate = this.targets.find("rate").value/1200

      let payment = (rate * balance)/(1 - ((1 + rate) ** (periods * -1)))
      

      this.targets.find("response").innerHTML = "The monthly payment is: $" + parseFloat(payment).toFixed(2)
    }
  }
