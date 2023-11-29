import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];

  connect() {
    console.log("connected");
  }

  showField(event) {
    const dateContainer = document.getElementById("vehicleFields");

    if (event.target.checked && event.target.value === "Car Accident") {
      dateContainer.classList.remove("hide-visibility");
    } else {
      dateContainer.classList.add("hide-visibility");
    }
  }
}
