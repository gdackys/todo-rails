import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.clearTimeout();

    this.timeout = setTimeout(() => {
      this.element.remove();
    }, 7000);
  }

  disconnect() {
    this.clearTimeout();
  }

  clearTimeout() {
    if (this.timeout) {
      clearTimeout(this.timeout);
    }
  }
}
