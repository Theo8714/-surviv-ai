import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="user-subscription"
export default class extends Controller {
  static targets = ["notification"]
  static values = { userId: String }

  connect() {
    if (this.userIdValue) {
      this.channel = createConsumer().subscriptions.create(
        { channel: "UserChannel", id: this.userIdValue },
        { received: (data) => {
          console.log(data)
          console.log(data.notification);
          this.notificationTarget.insertAdjacentHTML('beforeend', data.notification)
        }}
      )
      console.log(`Subscribed to the user with the id ${this.userIdValue}.`)
      console.log(this.notificationTarget)
    }
  }
}
