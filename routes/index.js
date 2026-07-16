// ./routes/index.js
import discs from './discs.js'
//import photos from './photos.js'
const mountRoutes = (app) => {
  app.use('/discs', discs)
  //app.use('/photos', photos)
  // etc..

}
 
export default mountRoutes