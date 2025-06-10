import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

String getRouteNameFromType(String type) {
  switch (type) {
    case 'article':
      return AppRoutes.htmlView;
    case 'usefulApp':
      return AppRoutes.usefullAppsPage;
    case 'mustKnow':
      return AppRoutes.mustKnowPage;
    case 'city':
      return AppRoutes.singleCityPage;
    case 'restaurant':
      return AppRoutes.viewAllPage;
    case 'place':
      return AppRoutes.viewAllPage;

    // case 'html':
    // case 'none':
    //  return showMessage('Error '); //TODO
    default:
      return AppRoutes.mustKnowPage;
  }
}
