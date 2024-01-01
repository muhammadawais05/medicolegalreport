import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];

  connect() {
    console.log("connected");
  }

  showField(event) {
    const carAccidentContainer = document.getElementById("vehicleFields");
    const nonRoadTrafficContainer = document.getElementById(
      "nonRoadTrafficFields"
    );

    if (event.target.checked) {
      if (event.target.value === "Car Accident") {
        carAccidentContainer.classList.remove("hide-visibility");
        // nonRoadTrafficContainer.classList.add("hide-visibility");
      } else {
        nonRoadTrafficContainer.classList.remove("hide-visibility");
        // carAccidentContainer.classList.add("hide-visibility");
      }
    } else {
      carAccidentContainer.classList.add("hide-visibility");
      nonRoadTrafficContainer.classList.add("hide-visibility");
    }
  }
}
