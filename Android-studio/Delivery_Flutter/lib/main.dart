import 'package:delivery_flutter/src/models/user.dart';
import 'package:delivery_flutter/src/pages/home/home_page.dart';
import 'package:delivery_flutter/src/pages/login/login_page.dart';
import 'package:delivery_flutter/src/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

User userSession=User.fromJson(GetStorage().read('user')??{});





void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title:'Delivery',
      debugShowCheckedModeBanner: false,
      initialRoute:userSession.id !=null ?'/home' :'/' ,
      getPages: [
        GetPage(name: '/', page:()=>LoginPage()),
        GetPage(name: '/register', page:()=>RegisterPage()),
        GetPage(name: '/home', page:()=>HomePage())
      ],
      theme: ThemeData(
        primaryColor:Colors.deepOrange,
        colorScheme: ColorScheme(
          primary:Colors.deepOrange,
          secondary: Colors.deepOrangeAccent,
          brightness: Brightness.light,
          onBackground: Colors.grey,
          onPrimary:Colors.grey,
          surface: Colors.grey,
          onSurface: Colors.grey,
          error: Colors.grey,
          onError: Colors.grey,
          onSecondary: Colors.grey,
          background: Colors.grey,
        )
      ),
      navigatorKey: Get.key,

    );
  }
}
