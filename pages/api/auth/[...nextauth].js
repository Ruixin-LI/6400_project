import NextAuth from 'next-auth';
import GoogleProvider from 'next-auth/providers/google';

export default NextAuth({
  providers: [
    GoogleProvider({
      clientId: '849205157156-h3qlhbr32pibpmn2954sqjppki8g1gu8.apps.googleusercontent.com',
      clientSecret: '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',
    }),
  ],
  // Add more configuration options here if needed
  secret: 'ZeGz03W807QyogQgf2K6/ltU77XjbuD1FrgU9v9qSWM=',
});
