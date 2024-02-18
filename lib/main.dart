import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_cr/_admin/allUsers.dart';
import 'package:smart_cr/_doctor/home/doctorHome.dart';
import 'package:smart_cr/_patient/home/patientHome.dart';
import 'package:smart_cr/manager/auth/authCtr.dart';
import 'package:smart_cr/manager/auth/login.dart';
import 'package:smart_cr/manager/loadingScreen.dart';
import 'package:smart_cr/manager/myVoids.dart';
import 'package:smart_cr/manager/styles.dart';
import 'package:smart_cr/manager/intro.dart';
import 'package:smart_cr/manager/bindings.dart';
import 'package:smart_cr/manager/myLocale/myLocale.dart';
import 'package:smart_cr/manager/myLocale/myLocaleCtr.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import '_doctor/notifications/awesomeNotif.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
SharedPreferences? sharedPrefs;

Future<void> initFirebase() async {  /// FIREBASE_INIT

  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  ///Crashlytics

  ///ANLYTICS


}

/// INTRO /////////
int introTimes = 0;
bool showIntro = true;
introTimesGet()async{
  introTimes = sharedPrefs!.getInt('intro')??0 ;
  print('## introTimes_get_<$introTimes>');

}
/// ////////////////

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Alarm.init(showDebugLogs: true);

  sharedPrefs = await SharedPreferences.getInstance();
  initFirebase();
  introTimesGet();
  await NotificationController.initializeLocalNotifications(debug: true);///awesome notif

  runApp(MyApp());

}

 Widget homePage(){
  String name = authCtr.cUser.name!;
  if(authCtr.cUser.isAdmin){
    showTos('Welcome admin ${name}');
    return AllUsers();
  }

  if(authCtr.cUser.role=='doctor'){
    showTos('Welcome Dr.${name}');
    return DoctorHome();
  }
  showTos('Welcome ${name}');
  return PatientHome();

}


class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyLocaleCtr langCtr =  Get.put(MyLocaleCtr());

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(

            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,

            title: 'Smart Care',
            theme: myTheme,

            initialBinding: GetxBinding(),

            locale: langCtr.initlang,
            translations: MyLocale(),

            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page: () => ((introTimes < introShowTimes)|| showIntro) ? IntroScreen():LoadingScreen()),
              //GetPage(name: '/', page: () => ScreenManager()),//in test mode

            ],
          );
        }
    );
  }
}

/// Buttons Page Route
class ScreenManager extends StatefulWidget {
  @override
  _ScreenManagerState createState() => _ScreenManagerState();
}


class _ScreenManagerState extends State<ScreenManager> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[


          // TextButton(
          //     onPressed: () {
          //       authCtr.signOut();
          //     },
          //     child: Text('sign out')),
          TextButton(
              onPressed: () {
                Get.to(() => LoadingScreen());
              },
              child: Text('LoadingScreen')),

          TextButton(
              onPressed: () async {
                await fbAuth.signOut();
                await googleSign.signOut();
                //sharedPrefs!.setBool('isGuest', false);
                print('## user signed out');
              },
              child: Text('LogOut')),
          TextButton(
              onPressed: () {
                //sharedPrefs!.remove('saved_purchases');
                sharedPrefs!.clear();
                print('##prefs_cleared');

              },
              child: Text('clear prefs')),
          // TextButton(
          //     onPressed: () {
          //       Get.to(() => SignInDemo());
          //     },
          //     child: Text('SignInDemo')),
          TextButton(
              onPressed: () {
                Get.to(() => Login());
              },
              child: Text('LoginPage')),


        ],
      ),
    );
  }
}
