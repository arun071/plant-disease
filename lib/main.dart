import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/services/disease_provider.dart';
import '/src/home_page/home.dart';
import '/src/home_page/models/disease_model.dart';
import '/src/suggestions_page/suggestions.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DiseaseAdapter());

  await Hive.openBox<Disease>('plant_diseases');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DiseaseService>(
      create: (context) => DiseaseService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Detect diseases',
        theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'SFRegular'),
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case Suggestions.routeName:
                    return const Suggestions();
                  case Home.routeName:
                  default:
                    return const Home();
                }
              });
        },
      ),
    );
  }
}
