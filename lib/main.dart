import 'package:wesave/Home/home.dart';
import 'package:wesave/ressource/export.dart';
import 'package:wesave/splash/splashScreen.dart';
import 'package:wesave/splash/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    defaultTransition: Transition.native,
    getPages: [
      GetPage(name: '/', page: () => Start()),
      GetPage(name: '/welcome', page: () => welcomePage()),
      GetPage(name: '/homepage', page: () => HomePage()),
    ],
  ));
}
