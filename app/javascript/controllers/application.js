import Rails from "@rails/ujs";
import { Application } from "@hotwired/stimulus";
const application = Application.start();
// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;
Rails.start();

export { application };
