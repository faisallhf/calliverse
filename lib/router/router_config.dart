import 'package:calliverse/pages/connection_page.dart';
import 'package:calliverse/pages/email_signup_page.dart';
import 'package:calliverse/pages/login_page.dart';
import 'package:calliverse/pages/otp_verification_page.dart';
import 'package:calliverse/pages/phone_signup_page.dart';
import 'package:calliverse/pages/profile_account_page.dart';
import 'package:calliverse/pages/subscription_page.dart';
import 'package:go_router/go_router.dart';
import 'package:calliverse/pages/splash_page.dart';

class CalliverseRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: '/splash_page',
    routes: [
      GoRoute(
        name: 'splash_page',
        path: '/splash_page',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: 'connection_page',
        path: '/connection_page',
        builder: (context, state) => const ConnectionPage(),
      ),
      GoRoute(
        name: 'emailsignupPage',
        path: '/emailsignup_page',
        builder: (context, state) => const EmailSignupPage(),
      ),
      GoRoute(
        name: 'phonesignupPage',
        path: '/phonesignup_page',
        builder: (context, state) => const PhoneSignupPage(),
      ),
      GoRoute(
        name: 'otpVerificationPage',
        path: '/otpverification_page/:type/:data',
        builder: (context, state) {
          String typeofVerification = state.pathParameters['type'] ?? '';
          String data = state.pathParameters['data'] ?? '';
          return OtpVerificationPage(
              typeofVerification: typeofVerification, data: data);
        },
      ),
      GoRoute(
        name: 'profileAccountPage',
        path: '/profile_account_page',
        builder: (context, state) => const ProfileAccountPage(),
      ),
      GoRoute(
        name: 'loginPage',
        path: '/loginPage',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: 'subscriptionPage',
        path: '/subscriptionPage',
        builder: (context, state) => const SubscriptionPage(),
      ),
    ],
  );

  GoRouter get router => _router;
}
