import 'package:calliverse/pages/call.dart';
import 'package:calliverse/pages/connection_page.dart';
import 'package:calliverse/pages/email_signup_page.dart';
import 'package:calliverse/pages/login_page.dart';
import 'package:calliverse/pages/otp_verification_page.dart';
import 'package:calliverse/pages/phone_signup_page.dart';
import 'package:calliverse/pages/profile_account_page.dart';
import 'package:calliverse/pages/subscription_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:calliverse/pages/splash_page.dart';

// TRANSITION FUNCTION
CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    // transitionDuration: Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeIn)),
            ),
            child: child),
  );
}

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
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context, state: state, child: const ConnectionPage()),
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
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context, state: state, child: const ProfileAccountPage()),
      ),
      GoRoute(
        name: 'login_page',
        path: '/login_page',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context, state: state, child: const LoginPage()),
      ),
      GoRoute(
        name: 'emailsignupPage',
        path: '/emailsignup_page',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context, state: state, child: const EmailSignupPage()),
      ),
      GoRoute(
        name: 'phonesignupPage',
        path: '/phonesignup_page',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context, state: state, child: const PhoneSignupPage()),
      ),
      GoRoute(
        name: 'subscriptionPage',
        path: '/subscriptionPage',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context, state: state, child: const SubscriptionPage()),
      ),
      GoRoute(
        name: 'call_page',
        path: '/call_page',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
            context: context, state: state, child: const Call()),
      ),
    ],
  );

  GoRouter get router => _router;
}
