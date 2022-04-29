import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  async formSubmit(){
      let city = this.targets.find("city").value
      let response = await fetch("https://api.openbrewerydb.org/breweries?by_city=" + city)
      let data = await response.json()
      let breweryName = data[0]["name"]
      let breweryStreet = data[0]["street"]
      let breweryZip = data[0]["postal_code"]
      this.targets.find("entry").innerHTML = "Here is a brewery in " + city + ":   " + breweryName + " " + breweryStreet + " " + breweryZip
  }
}
