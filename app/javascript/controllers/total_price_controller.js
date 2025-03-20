import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {
  static targets = ["checkIn", "checkOut", "pricePerNight", "totalPrice"];

  connect() {
    console.log("✅ TotalPriceController connected"); // Debugging step
  }

  calculate() {
    console.log("🔄 Calculating total price..."); // Debugging step

    let checkInValue = this.checkInTarget.value;
    let checkOutValue = this.checkOutTarget.value;
    let pricePerNight = parseFloat(this.pricePerNightTarget.dataset.price);

    console.log("📅 Raw Check-in:", checkInValue);
    console.log("📅 Raw Check-out:", checkOutValue);

    if (checkInValue && checkOutValue) {
      // Correctly parse the date from "YYYY-MM-DD" format
      let checkInDate = new Date(checkInValue);
      let checkOutDate = new Date(checkOutValue);

      console.log("📅 Parsed Check-in:", checkInDate);
      console.log("📅 Parsed Check-out:", checkOutDate);

      if (!isNaN(checkInDate.getTime()) && !isNaN(checkOutDate.getTime()) && checkOutDate > checkInDate) {
        let days = Math.ceil((checkOutDate - checkInDate) / (1000 * 60 * 60 * 24)); // Convert milliseconds to days
        let totalPrice = days * pricePerNight;
        this.totalPriceTarget.innerText = totalPrice.toFixed(2);
      } else {
        this.totalPriceTarget.innerText = "0";
      }
    } else {
      this.totalPriceTarget.innerText = "0";
    }
  }
}
