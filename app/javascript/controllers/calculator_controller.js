import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  log(){
      let principal = this.targets.find("principal").value
      let interest = this.targets.find("interest").value
      let years = this.targets.find("years").value
      let amount = principal * ((1 + (interest/100)) ** years)
      this.targets.find("amount").innerHTML = "The amount you will have is: $" + amount 
  }
}

