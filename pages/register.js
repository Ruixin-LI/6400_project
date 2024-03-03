import { useState } from 'react';
import { useRouter } from 'next/router';

export default function Register() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [email, setEmail] = useState('');
  const router = useRouter();

  const handleSubmit = async (e) => {
    e.preventDefault();
    // Here you would call an API route that uses createUser
    const response = await fetch('/api/auth/register', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ username, password, email }),
    });

    if (response.ok) {
      // On successful registration, redirect to the login page or another page
      router.push('/login');
    } else {
      // Handle errors, e.g., display a notification to the user
      console.error('Failed to register');
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <label htmlFor="username">Username</label>
      <input
        id="username"
        name="username"
        type="text"
        value={username}
        onChange={(e) => setUsername(e.target.value)}
      />

      <label htmlFor="password">Password</label>
      <input
        id="password"
        name="password"
        type="password"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
      />

      <label htmlFor="email">Email</label>
      <input
        id="email"
        name="email"
        type="text"
        value={email}
        onChange={(e) => setEmail(e.target.value)}
      />

      <button type="submit">Register</button>
    </form>
  );
}
