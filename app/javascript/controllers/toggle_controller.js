import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement"]
  static values = {
    isLogin: Boolean,
    loginUrl: String
  }

  fire() {
    if(this.isLoginValue){
      console.log(this.loginUrlValue)
      alert("save appliances after login, click to login in")
      Turbo.visit(this.loginUrlValue)
    }else{
    this.togglableElementTarget.classList.toggle("d-none");
    }
  }
}
