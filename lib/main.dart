import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nanny_co/parent/add_child/Controller/add_child_cubit.dart';
import 'package:nanny_co/parent/parent_profile/Controller/update_parent_cubit/update_parent_cubit.dart';
import 'package:nanny_co/parent/search_view/Controller/search_nany_cubit.dart';
import 'package:nanny_co/shared_cubit/auth_cubit/auth_cubit.dart';
import 'package:nanny_co/shared_cubit/settings_hive/settings_cubit_hive.dart';
import 'package:nanny_co/splash/splash_view.dart';
import 'package:path_provider/path_provider.dart';

import 'instance.dart';
import 'nany/nanny_profile/Controller/update_nanny_profile_cubit.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await setupFlutterNotifications();
}

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.', // description
  importance: Importance.max,
);

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }
}

String storagePath = '';
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  Directory storageDirectory = (await getApplicationDocumentsDirectory());

  final storage = await HydratedStorage.build(storageDirectory: storageDirectory);

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await Firebase.initializeApp();
  HydratedBlocOverrides.runZoned(
      () => runApp(MultiBlocProvider(providers: [
            BlocProvider.value(value: injector.get<AuthCubit>()),
            BlocProvider.value(value: injector.get<SettingsHiveCubit>()),
            BlocProvider.value(value: injector.get<UpdateParentCubit>()),
            BlocProvider.value(value: injector.get<UpdateNannyProfileCubit>()),
            BlocProvider.value(value: injector.get<AddChildCubit>()),
            BlocProvider.value(value: injector.get<SearchNannyCubit>()),
          ], child: const MyApp())),
      storage: storage);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    FirebaseMessaging.onBackgroundMessage((message) async => showFlutterNotification(message));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Color(0xff35034C)),
      home: SplashView(),
    );
  }
}
