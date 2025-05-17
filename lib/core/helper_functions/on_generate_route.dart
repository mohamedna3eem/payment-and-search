import 'package:flutter/material.dart';
import 'package:pharma_now/features/auth/presentation/views/Reset_password_view.dart';
import 'package:pharma_now/features/auth/presentation/views/singn_in_view.dart';
import 'package:pharma_now/features/auth/presentation/views/singn_up_view.dart';
import 'package:pharma_now/features/auth/presentation/views/widget/forget_password_view_body.dart';
import 'package:pharma_now/features/cart/presentation/views/Cart_view.dart';
import 'package:pharma_now/features/splash/presentation/views/splash_view.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/verification_view_signup.dart';
import '../../features/cart/presentation/views/widgets/payment/payment.dart';
import '../../features/favorites/presentation/views/favorites.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/product_view.dart';
import '../../features/new products/presentation/views/new_products_view.dart';
import '../../features/notifications/presentation/views/notification_view.dart';
import '../../features/offers/presentation/views/offers_view.dart';
import '../../features/on_boarding/presentation/views/onboarding_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/profile/presentation/views/widgets/profile_tab/edit_profile_view.dart';
import '../../features/profile/presentation/views/widgets/profile_tab/notification_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/shopping by category/presentation/views/categories_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());

    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());

    case SingnUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SingnUpView());

    case VerificationView.routeName:
      return MaterialPageRoute(builder: (context) => const VerificationView());

    case ResetPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => const ResetPasswordView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());

    case FavoriteView.routeName:
      return MaterialPageRoute(builder: (context) => const FavoriteView());

    case NewProductView.routeName:
      return MaterialPageRoute(builder: (context) => const NewProductView());

    case NotificationView.routeName:
      return MaterialPageRoute(builder: (context) => const NotificationView());

    case OffersView.routeName:
      return MaterialPageRoute(builder: (context) => const OffersView());

    case SearchView.routeName:
      return MaterialPageRoute(builder: (context) => const SearchView());

    case CategoriesView.routeName:
      return MaterialPageRoute(builder: (context) => const CategoriesView());

    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileView());

    case Notifications.routeName:
      return MaterialPageRoute(builder: (context) => Notifications());

    case EditProfile.routeName:
      return MaterialPageRoute(builder: (context) => EditProfile());

    case ProductView.routeName:
      return MaterialPageRoute(builder: (context) => ProductView());

    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
          builder: (context) => const ForgetPasswordView());
    case CartView.routeName:
      return MaterialPageRoute(builder: (context) => const CartView());
      case PaymentPage.routeName:
      return MaterialPageRoute(builder: (context) => PaymentPage());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
