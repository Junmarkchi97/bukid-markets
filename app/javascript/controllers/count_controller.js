import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  

  connect() {
  var size = <%= current_order.order_items.size %>
  var subtotal = <%= current_order.subtotal %>
  
    this.element.textContent =
      `${size} ${subtotal}`;
  }
}
