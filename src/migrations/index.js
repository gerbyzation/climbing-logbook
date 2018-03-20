/*
 * 1. Load migration stuff from db
 * 2. Load migration files
 * 3. Find files unapplied yet
 * 4. Execute unapplied SQL files
 * 5. Update DB
 */
const db = require('../db');

(async () => {
  try {
    const res = await db.query(`
    SELECT EXISTS (
      SELECT 1
      FROM information_schema.tables
      WHERE table_schema = 'logbook'
      AND table_name = 'migrations' 
    ) as exists;`);
    console.log(res.rows[0].anonymous.exists);
  } catch(e) {
    console.log(e)
  }
})()



