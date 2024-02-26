const db = require('./db');
const bcrypt = require('bcrypt');

const findUser = async (username) => {
  try {
    // This assumes you have a "users" table with columns "username" and "password"
    const queryText = 'SELECT id, username, password, email FROM users WHERE username = $1';
    const { rows } = await db.query(queryText, [username]);
    return rows[0]; // returns undefined if no rows are returned
  } catch (err) {
    console.error('Error querying the database:', err);
    throw err;
  }
};

const createUser = async (username, password, email) => {
  const hashedPassword = await bcrypt.hash(password, 10); // Always hash passwords before storing them!
  const queryText = 'INSERT INTO users (username, password, email) VALUES ($1, $2, $3)';
  const values = [username, hashedPassword, email];

  try {
    await db.query(queryText, values);
    console.log('User created successfully');
  } catch (err) {
    console.error('Error inserting new user', err);
  }
}

const validatePassword = async (user, password) => {
  try {
    // user.password should be the hashed password stored in the database
    return await bcrypt.compare(password, user.password);
  } catch (err) {
    console.error('Error validating password:', err);
    throw err;
  }
};

module.exports = {
  findUser,
  validatePassword,
  createUser
};
