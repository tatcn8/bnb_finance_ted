import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  log(){
      let principal = this.targets.find("principal").value
      let interest = this.targets.find("interest").value
      let years = this.targets.find("years").value
      let annual = this.targets.find("annual").value
      let newPrincipal
      let amount 
      for (let i = 0; i < years; i++){
        newPrincipal = parseFloat(annual) + (principal * (1 + (interest/100)))
        principal = newPrincipal
        amount = parseFloat(principal).toFixed(2)      
     }
     console.log(principal,'works')
     this.targets.find("amount").innerHTML = "The amount you will have is $" + amount
    }
  }

