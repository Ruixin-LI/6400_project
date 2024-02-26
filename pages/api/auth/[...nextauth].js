import NextAuth from 'next-auth';
import GoogleProvider from 'next-auth/providers/google';
import CredentialsProvider from 'next-auth/providers/credentials';
import { findUser, validatePassword } from '../models/userModel';



export default NextAuth({
  providers: [
    GoogleProvider({
      name: 'google',
      clientId: '849205157156-h3qlhbr32pibpmn2954sqjppki8g1gu8.apps.googleusercontent.com',
      clientSecret: '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',
    }),
    CredentialsProvider({
      name: 'credentials',
      credentials: {
        username: { label: 'Username', type: 'text' },
        password: { label: 'Password', type: 'password' },
      },
      authorize: async (credentials) => {
        const user = await findUser(credentials.username);
        if (!user) {
          throw new Error('No user found with the username');
        }
        const isValid = await validatePassword(user, credentials.password);
        if (!isValid) {
          throw new Error('Password is incorrect');
        }
        return { id: user.id, name: user.username, email: user.email };
      },
    }),
  ],
  // the key to encrypt the credential cookie
  secret: 'ZeGz03W807QyogQgf2K6/ltU77XjbuD1FrgU9v9qSWM=',
});
