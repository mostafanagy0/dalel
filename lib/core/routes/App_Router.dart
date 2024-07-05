import 'package:dalel/feature/auth/presentation/views/signIn_view.dart';
import 'package:dalel/feature/auth/presentation/views/signUp_View.dart';
import 'package:dalel/feature/on_bording/presentation/views/on_bording_view.dart';
import 'package:dalel/feature/splash/presentation/views/splash%20_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: "/onBording",
      builder: (context, state) => const OnBordingView(),
    ),
    GoRoute(
      path: "/signUp",
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: "/signIn",
      builder: (context, state) => const SignInView(),
    ),
  ],
);
