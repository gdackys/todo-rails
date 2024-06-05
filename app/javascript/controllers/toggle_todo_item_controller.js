import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-todo-item"
export default class extends Controller {
  toggle() {
    this.element.requestSubmit();
  }
}
