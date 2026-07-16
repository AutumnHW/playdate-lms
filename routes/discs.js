import Router from 'express'
const router = new Router();
export default router
//import db from './db.js'
router.get('/:id', (req, res) => {
res.send({
    "disc_name":"foo", 
    "disc_contents" : '',
    "software_ids" : ['0069', '0038'],


});
});