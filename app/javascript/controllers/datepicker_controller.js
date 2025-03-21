import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["checkIn", "checkOut", "totalPrice", "pricePerDay", "hiddenCheckIn", "hiddenCheckOut", "hiddenTotalPrice", "submitButton"];

  connect() {
    this.initFlatpickr();
  }

  initFlatpickr() {
    flatpickr(this.checkInTarget, {
      dateFormat: "Y-m-d",
      onChange: this.calculateTotalPrice.bind(this),
    });

    flatpickr(this.checkOutTarget, {
      dateFormat: "Y-m-d",
      onChange: this.calculateTotalPrice.bind(this),
    });
  }

  calculateTotalPrice() {
    const checkInDateString = this.checkInTarget.value;
    const checkOutDateString = this.checkOutTarget.value;
    const pricePerDay = parseFloat(this.pricePerDayTarget.dataset.price);

    if (checkInDateString && checkOutDateString) {
      // Convert "YYYY-MM-DD" strings into year, month, day as numbers
      const [checkInYear, checkInMonth, checkInDay] = checkInDateString.split("-").map(Number);
      const [checkOutYear, checkOutMonth, checkOutDay] = checkOutDateString.split("-").map(Number);

      // Convert dates to comparable values (Days since year 0)
      const checkInTotalDays = this.dateToDays(checkInYear, checkInMonth, checkInDay);
      const checkOutTotalDays = this.dateToDays(checkOutYear, checkOutMonth, checkOutDay);

      if (checkOutTotalDays > checkInTotalDays) {
        const diffInDays = checkOutTotalDays - checkInTotalDays;
        const totalPrice = diffInDays * pricePerDay;
        this.totalPriceTarget.innerText = `${totalPrice}`;

        // Set hidden inputs with the calculated values
        this.hiddenCheckInTarget.value = checkInDateString;
        this.hiddenCheckOutTarget.value = checkOutDateString;
        this.hiddenTotalPriceTarget.value = totalPrice;
      } else {
        this.totalPriceTarget.innerText = "0";
      }
    }
  }

  // Helper function to calculate total days from year, month, day
  dateToDays(year, month, day) {
    return year * 365 + month * 30 + day;  // Approximate conversion, assumes 30-day months
  }

  // Handle form submission via AJAX
  submit(event) {
    const formData = new FormData(event.target);
    const formAction = event.target.action;

    // Disable the submit button to prevent multiple submissions
    this.submitButtonTarget.disabled = true;

    // Manually append the hidden fields to FormData before submission
    formData.set("booking[check_in_date]", this.hiddenCheckInTarget.value);
    formData.set("booking[check_out_date]", this.hiddenCheckOutTarget.value);
    formData.set("booking[total_price]", this.hiddenTotalPriceTarget.value);

    // Perform the AJAX POST request
    fetch(formAction, {
        method: "POST",
        headers: {
            "X-CSRF-Token": this.csrfToken,
            "Accept": "application/json",
            "Content-Type": "application/json"
        },
        body: formData
    })
      .then(response => response.json())
      .then(data => {
        // Handle response when the booking is successfully added
        if (data.inserted_item) {
          // Insert the new booking details (or any other response)
          console.log("Booking added:", data.inserted_item);
        }

        // Re-enable the submit button after submission
        this.submitButtonTarget.disabled = false;
      })
      .catch(error => {
        console.error("Error submitting form:", error);
        this.submitButtonTarget.disabled = false;
      });
  }
}
