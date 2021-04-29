import { Controller } from "stimulus"
import Rails from '@rails/ujs'

export default class extends Controller {
  static targets = [ "btn" ]

  addToPocket(id) {
    Rails.ajax({
      url: `/restaurants/${id}/pocket_list`,
      type: 'post',
      success: res => {
        if (res.status == 'added') {
          this.btnTarget.classList.add('like-btn-favorited')
        } else {
          this.btnTarget.classList.remove('like-btn-favorited')
        }
      },
      error: err => {
        console.log(err)
      }
    })
  }

  add() {
    this.addToPocket(this.btnTarget.dataset['id'])
  }
}
