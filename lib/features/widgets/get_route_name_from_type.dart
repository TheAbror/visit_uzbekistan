import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

String? getRouteNameFromType(String type) {
  switch (type) {
    case 'article':
      return AppRoutes.articlePage;
    case 'useful_app':
      return AppRoutes.usefullAppsPage;
    case 'mustKnow':
      return AppRoutes.mustKnowPage;
    case 'city':
      return AppRoutes.singleCityPage;
    case 'restaurant':
      return AppRoutes.restaurantPage;
    case 'place':
      return AppRoutes.placePage;
    case 'car_rental':
      return AppRoutes.transportPage;
    case 'tour':
      return AppRoutes.toursPage;

    default:
      return null;
  }
}
