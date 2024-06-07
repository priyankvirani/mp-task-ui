import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mp_ui/utils/app_providers.dart';
import './config/di_container.dart' as di;
import 'config/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  di.sl.registerSingleton<AppRouter>(AppRouter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providerList(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          key: navigatorKey,
          theme: ThemeData(
            useMaterial3: false,
          ),
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ));
  }
}
