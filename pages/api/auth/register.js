import { createUser } from '../models/userModel';

export default async function handler(req, res) {
  if (req.method === 'POST') {
    try {
      const { username, password, email } = req.body;
      await createUser(username, password, email);
      return res.status(200).json({ message: 'User created successfully' });
    } catch (error) {
      return res.status(500).json({ message: 'Error creating user', error: error.message });
    }
  } else {
    res.setHeader('Allow', ['POST']);
    return res.status(405).end(`Method ${req.method} Not Allowed`);
  }
}
