import 'package:flutter/material.dart';
import 'package:shukrann_new/main.dart';
import 'package:shukrann_new/screens/login_screen.dart';
import 'package:shukrann_new/screens/routes/route_names.dart';

import '../error.dart';

class CustomRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
    return MaterialPageRoute(builder: (_) => ErrorPage());
  }
}
