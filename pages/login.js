'use client';
import { signIn, signOut, useSession } from 'next-auth/react';

function Login() {
  const { data: session } = useSession();

  if (session) {
    return (
      <>
        <p>Signed in as {session.user.email}</p>
        <button onClick={() => signOut()}>Sign out</button>
      </>
    );
  }

  return (
    <>
      <p>Not signed in</p>
      <button onClick={() => signIn('google')}>Sign in with Google</button>
    </>
  );
}

export default Login;