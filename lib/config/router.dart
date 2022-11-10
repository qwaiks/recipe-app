import 'package:chefio/config/routes.dart';
import 'package:chefio/views/auth/account_recovery.screen.dart';
import 'package:chefio/views/auth/login.screen.dart';
import 'package:chefio/views/auth/otp_validation.screen.dart';
import 'package:chefio/views/auth/register.screen.dart';
import 'package:chefio/views/auth/reset_password.screen.dart';
import 'package:chefio/views/dashboard/dashboard.screen.dart';
import 'package:chefio/views/onboarding/onboarding.screen.dart';
import 'package:chefio/views/recipe/create_recipe/add_ingredients.dart';
import 'package:chefio/views/recipe/create_recipe/create_recipe.dart';
import 'package:chefio/views/recipe/recipe_details/recipe_details.dart';
import 'package:chefio/views/search/search.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const OnBoardingScreen();
    },
  ),
  GoRoute(
    path: RoutesPaths.onboard,
    builder: (BuildContext context, GoRouterState state) {
      return const OnBoardingScreen();
    },
  ),
  GoRoute(
    path: RoutesPaths.login,
    builder: (BuildContext context, GoRouterState state) {
      return const LoginScreen();
    },
  ),
  GoRoute(
    path: RoutesPaths.register,
    builder: (BuildContext context, GoRouterState state) {
      return const RegisterScreen();
    },
  ),
  GoRoute(
    path: RoutesPaths.otpValidation,
    builder: (BuildContext context, GoRouterState state) {
      return const OtpValidationScreen();
    },
  ),
  GoRoute(
    path: RoutesPaths.accountRecovery,
    builder: (BuildContext context, GoRouterState state) {
      return const AccountRecoveryScreen();
    },
  ),
  GoRoute(
    path: RoutesPaths.resetPassword,
    builder: (BuildContext context, GoRouterState state) {
      return const ResetPasswordScreen();
    },
  ),
  GoRoute(
    path: RoutesPaths.dashboard,
    builder: (BuildContext context, GoRouterState state) {
      return const DashboardScreen();
    },
  ),
  GoRoute(
    path: RoutesPaths.recipeDetials,
    builder: (context, state) {
      final num = state.extra as Map;
      return RecipeDetailsScreen(
        index: num['index'],
      );
    },
  ),
  GoRoute(
    path: RoutesPaths.search,
    builder: (context, state) {
      return const SearchScreen();
    },
  ),
  GoRoute(
    path: RoutesPaths.createRecipe,
    builder: (context, state) {
      return const CreateRecipeScreen();
    },
  ),
  GoRoute(
    path: RoutesPaths.addIngredients,
    builder: (context, state) {
      return const AddIngredientScreen();
    },
  ),
]);
