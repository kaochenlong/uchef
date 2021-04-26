import Rails from "@rails/ujs"

document.addEventListener('DOMContentLoaded', () => {
  let likeBtn = document.querySelector('#like-btn')

  if (likeBtn) {
    likeBtn.addEventListener('click', e => {
      let btn = e.target
      let id = btn.dataset['id']

      Rails.ajax({
        url: `/restaurants/${id}/pocket_list`,
        type: 'post',
        success: res => {
          if (res.status == 'added') {
            btn.classList.add('like-btn-favorited')
          } else {
            btn.classList.remove('like-btn-favorited')
          }
        },
        error: err => {
          console.log(err)
        }
      })
    })
  }
})
