import { Urbit } from '@urbit/http-api'
const api = new Urbit('http://localhost:8080', 'lidlut-tabwed-pillex-ridrup', 'safe')
// const api = new Urbit('', '', 'safe')
if (typeof window !== 'undefined') {
  // @ts-ignore
  console.log('inside useUrbit: ', window.ship)
  // @ts-ignore
  //api.ship = window.ship
  api.ship = 'zod'
  api.verbose = true
}

// @ts-ignore
// window.api = api

export default api
