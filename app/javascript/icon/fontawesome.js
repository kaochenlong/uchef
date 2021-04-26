import { library, dom } from '@fortawesome/fontawesome-svg-core'
import {
  faUserAstronaut,
  faHeart
} from '@fortawesome/free-solid-svg-icons'

import {
  faThumbsUp
} from '@fortawesome/free-regular-svg-icons'

library.add(
  faUserAstronaut,
  faHeart,
  faThumbsUp
)

dom.watch()
