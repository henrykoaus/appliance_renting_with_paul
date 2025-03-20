import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

// Connects to data-controller="ajax"
export default class extends Controller {
  static targets = ["heart_togglableElement"]
  static values = {
    isLogin: Boolean,
    loginUrl: String,
    applianceId: String,
    saveFavouriteUrl: String
  }
  connect() {
    this.csrfToken = document.querySelector("[name='csrf-token']").content
  }
  save_favourite() {
    if(this.isLoginValue){
      console.log(this.loginUrlValue)
      alert("save appliances after login, click to login in")
      Turbo.visit(this.loginUrlValue)
    }else{
      // console.log(this.saveFavouriteUrlValue)
      this.heart_togglableElementTarget.className =
          this.heart_togglableElementTarget.className === "fas fa-heart fa-lg" ?
              "far fa-heart fa-lg" : "fas fa-heart fa-lg"
      const formData = new FormData()
      formData.append('appliance_id', this.applianceIdValue)
      // fetch url
      fetch(this.saveFavouriteUrlValue, {
        method: "POST", // Could be dynamic with Stimulus values
        headers: {
          "X-CSRF-Token": this.csrfToken,
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          favourite: {
            appliance_id: this.applianceIdValue,
          }
        })
      })
          .then(response => response.json())
          .then((data) => {
            console.log(data)
          })
      // this.blank_heart_togglableElementTarget.classList.toggle("d-none");
      // this.solid_heart_togglableElementTarget.classList.toggle("d-none");
    }
  }
}
