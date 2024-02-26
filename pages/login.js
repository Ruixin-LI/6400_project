'use client';
import { signIn, signOut, useSession } from 'next-auth/react';
import Link from 'next/link';

function Login() {
  const { data: session } = useSession();

  const handleSignIn = async (e) => {
    e.preventDefault();
    const username = e.target.username.value;
    const password = e.target.password.value;

    // Use 'credentials' as the provider ID for username/password authentication
    const result = await signIn('credentials', {
      redirect: false,
      username,
      password,
    });

    if (!result.error) {
      // Handle success
      console.log('Signed in successfully!');
    } else {
      // Handle error
      console.error('Failed to sign in:', result.error);
    }
  };

  if (session) {
    return (
      <>
        <p>Signed in as {session.user.email}</p>
        {console.log(session)}
        <button onClick={() => signOut()}>Sign out</button>
      </>
    );
  }

  return (
    <>
      <p>Not signed in</p>
      {/* <button onClick={() => signIn('google')}>Sign in with Google</button> */}
      <form onSubmit={handleSignIn}>
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <button type="submit">Sign in with Username and Password</button>
      </form>
      <Link href="/register">
        <a>Create User</a>
      </Link>
    </>
  );
}

export default Login;
