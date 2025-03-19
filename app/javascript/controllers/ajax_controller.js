import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ajax"
export default class extends Controller {
  static targets = ["input", "stars", "comment", "submitButton", "reviewsList"];

  connect() {
    console.log(`Connected!!`);
  }

  // When the form is submitted
  submit(event) {
    event.preventDefault();

    const formData = new FormData(event.target);
    const formAction = event.target.action;

    // Disable the submit button to prevent multiple submissions
    formData.set(this.inputTarget.name, this.inputTarget.value);

    this.submitButtonTarget.disabled = true;

    // Perform the AJAX POST request
    fetch(formAction, {
      method: "POST",
      headers: {
        "Accept": "application/json"
      },
      body: formData
    })
      .then(response => response.json())
      .then(data => {
        // Handle response when the review is successfully added
        if (data.inserted_item) {
          // Insert the new review at the beginning
          this.reviewsListTarget.insertAdjacentHTML("beforeend", data.inserted_item);
        }

        if (data.form) {
          // Re-render the form if needed (for example, show validation errors)
          this.formTarget.outerHTML = data.form;
        }

        // Re-enable the submit button after submission
        this.submitButtonTarget.disabled = false;
      })
      .catch(error => {
        console.error("Error submitting form:", error);
        this.submitButtonTarget.disabled = false;
      });
  }

  // Star rating interaction
  select(event) {
    const selectedValue = parseInt(event.target.getAttribute("data-ajax-value"));
    const currentValue = parseInt(this.inputTarget.value) || 0; // Get current value

    if (selectedValue === currentValue) {
      // If clicking the same star, remove selection (reset to 0)
      this.inputTarget.value = 0;
      this.updateStars(0);
    } else {
      // Otherwise, set the new rating
      this.inputTarget.value = selectedValue;
      this.updateStars(selectedValue);
    }

    console.log(`Selected rating: ${this.inputTarget.value}`);
  }

  // Update stars' visual state based on the selected rating
  updateStars(value) {
    const stars = this.starsTarget.querySelectorAll(".star");

    stars.forEach((star, index) => {
      if (index < value) {
        star.classList.remove("far", "text-secondary");
        star.classList.add("fas", "text-warning");
      } else {
        star.classList.remove("fas", "text-warning");
        star.classList.add("far", "text-secondary");
      }
    });
    console.log(`Updated!! with ${value}`);

  }
}
