import 'dart:async';
import 'package:app_links/app_links.dart';

import '../../main.dart';
import '../utilities/app_routes.dart';

class DeepLinkService{
  late AppLinks _appLinks;
  initAppLink() async {
    _appLinks = AppLinks();
    _appLinks.uriLinkStream.listen((Uri? uri) {
      if(uri != null){
        _handleDeepLink(uri);
      }});
    final Uri? initialLink = await _appLinks.getInitialLink();
    if(initialLink != null){
      _handleDeepLink(initialLink);
    }

  }


  _handleDeepLink(Uri uri){
    if(uri.pathSegments.isNotEmpty && uri.pathSegments.first == "salon-details"){
      final salonId = uri.pathSegments.last;
      if(salonId.isNotEmpty) {
        navigatorKey.currentState?.pushNamed(AppRoutes.salonDetailsRoute,arguments: salonId);
      }
    }
  }






}



