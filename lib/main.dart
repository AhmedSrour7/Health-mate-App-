import 'dart:convert';

// import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/firebase_options.dart';
import 'package:health_mate/screens/core/auth_type_screen.dart';
import 'package:health_mate/screens/core/splash_screen.dart';
// import 'dart:convert' as convert;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:health_mate/screens/doctor/doctor_bottom_navigation_bar_screen.dart';
import 'package:health_mate/screens/observer/observer_bottom_navigation_bar_screen.dart';
import 'package:health_mate/screens/patient/patient_bottom_navigation_bar_screen.dart';
import 'package:http/http.dart' as http;
import 'bloc/bloc_observe.dart';
import 'bloc/doctor/doctor_cubit.dart';
import 'bloc/observer/observer_cubit.dart';
import 'bloc/patient/user_cubit.dart';
import 'constant/constant.dart';
import 'helper/cache helper.dart';
import 'helper/dio_helper.dart';
import 'package:url_launcher/url_launcher.dart';

/// BackGroundNotification
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  DioHelper.init();

  /// Firebase messaging
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseAuth.instance.signOut();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(alert: true, announcement: false, badge: true, carPlay: false, criticalAlert: false, provisional: false, sound: true,);
  if (kDebugMode) {
    print('User granted permission: ${settings.authorizationStatus}');
  }
  // currentFCMToken = await FirebaseMessaging.instance.getToken();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((event) {

    print('User granted permission: ${settings.authorizationStatus}');

  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {});
  /// app_language Cached
  type=CacheHelper.getData(key: "type");
  /// user token Cached
  token=CacheHelper.getData(key: "token");
  Widget ?startScreen;
  if (token != null) {
    /// if user auth before go to home page else go to login to auth
    if (type != null) {
      if (type=="patient" ) {
        startScreen=PatientBottomNavigationBarPage();
      }else if(type=="doctor"){
        startScreen=DoctorBottomNavigationBarPage();

      }
      else {
        startScreen= ObserverBottomNavigationBarPage();
      }
    } else {
      /// user not auth before
      startScreen= const AuthTypePage();
    }
  } else {
    /// if user go to app in first time onBoarding appear
    startScreen = const AuthTypePage();
  }
  runApp( MyApp(startScreen: startScreen,));
}

class MyApp extends StatelessWidget {
  Widget startScreen;

  MyApp({required this.startScreen});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit()..getUserInfo(),
        ),
        BlocProvider(
          create: (context) => DoctorCubit()..getDoctorInfo()..getAllPatient(),
        ),
        BlocProvider(
          create: (context) => ObserverCubit()..getObserverInfo()..getPatientDetails(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage( startScreen: startScreen,),
      ),
    );
  }
}
///send push notification function (it's called in the onpressedsend in the chatpage)
Future<void> sendPushNotification(String recipientToken, String title, String body, Map<String, dynamic> additionalData) async {
  try {
    final String serverKey = 'AAAAkuL4XKo:APA91bHpVHfCTtACIJcUrHNBB__z9V3cBlyfQqSy3JvzueNT2vbqkURWWAUWyfYOrkMSanS4FrD-tlYPfaYzn17uK_Nl1ySWtK4aD_WNWacDmmDqzL_QQcF58libIUv_AC-yasfdTO8Y';
    final String fcmEndpoint = 'https://fcm.googleapis.com/fcm/send';

    final Map<String, dynamic> requestData = {
      'to': recipientToken,
      'notification': {
        'title': title,
        'body': body,
      },
      'data': additionalData, // This is the necessary to navigate the chat page.
    };

    final http.Response response = await http.post(
      Uri.parse(fcmEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverKey',
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      print('Chat Push notification sent successfully');
    } else {
      print('Failed to send Chat push notification: ${response.statusCode}');
    }
  } catch (e) {
    print('Error sending Chat push notification: $e');
  }
}
Future<String> getAccessToken() async {
  // Your client ID and client secret obtained from Google Cloud Console
  final serviceAccountJson = {
    "type": "service_account",
    "project_id": "health-care-chat-7f677",
    "private_key_id": "49349cc750b539052364e4adee44fdcc36d502b1",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDmWCQzwikCecG+\nfmMeFw5DEpi33scMXbcOjfF+nhIwrD3g1jQw2WtNMy0UIe+Lgb1HQ5w/6apTrfM7\nUkmkTVE1RyRGUI8+CntuNTKXfvHc5twerUMaxkR0ExbMWZ4dHTmvbhuiI2Vn0u04\nV2Ojk7TmH6R38WrA5qL4Fi8NuFQJZtMjAhO9z9SG4C3llCb1t8hjWk2+4B5gecjk\nQ69gvzY4OG7x/A6vH2lpH9vzUEOdwAUuxe1c2Th8DAq9Rr0G/YDsl0hUmpnqSeCp\nWrO1gYdi4YTUwQB65cD6c3wPAicVvIi/wRAEiYe5FQYvzXgUQGu48bTOi8qa2yp9\nxEwtq6EtAgMBAAECggEACdOHQdT90l720qVKHam+oEJeFPPyOlcSHNMV0wCzxnNG\nlX2VzuKrhujQurvi3+jqNezOsNRLQZQZXPW68gEhXnw5Mi20GqGwV8h5rshJ0ZJg\noAdkpjMAjxIUZiXJjrTlNdRk5eMMK6RuHbnupHcD39BIQByioPWFzL8HhVaQcTEm\nw6/f5TRUItU0GHlHrIdFY4ON+RmWi6nePzLY5hXPk9TO6Kbwbu5OhtP8EpTyn+m6\nnX4v51GqlAjdz6ihUZiIb8ElyQdQEKnXUHPcj20HPXco3maCBJm7fJRvITXjx9F+\ni1mymrCKoFSavkxog9V6FZ7lBOppCpfnRE7fO6gUYQKBgQD734++sO8cqyt3af7A\nLWtERVBkkU0nvsfdyOJerEyyu4VOsTIm6hZTTum8zL6uI0/WP7uJR1uAu1hKue28\ni34ElS+Vdwps0XP5gdUlIH9vXn0On4xebpTjmoS2RVDKrSzLBPXvtCKoEgfYc9kq\nkQXMpY3tvZVHncQDPCby/yO/4QKBgQDqHkfEx0QVZxBDmFMGPfICVwtyIESuxhnb\nE5aZQWV5JlyqCwG1PHx8/TTTcOtwRNDgR6Cd9D7jkoLpsmhF2NeAhvd6oHqI5Uqn\nU+p2loLMue8ty5f9xBeJFMNT13jRnmajzq/vUBdFwxiGuU7Pvstf0Qcwo1zvFXPV\nH60YHtI6zQKBgQCP4+f6yJnRhvgOAD/JCil9lxuWWGv7iMIlsd2guE4YzYgarKA6\nGwEmFq7xbQaB9Spm+4HnqxxbLqwCBLYMQKR9ebz1ZkxOXloi8EkULLygoxpOgFdw\nmzvzyxKGDpNZNhWg5fSaPA6QdbyFq6kk6DSn9OxgJS5i+34/Wt3ldFy4AQKBgEvp\nWZgCjJ7r9igUwgbqGwiLNNjigaKx9TxF07UJsV9hAvbX7svXOv5EE9bjbFPQ3HF8\niCXvRlz/6pbgFFNhhi7UlHYcht7Qii5LVWDyWKMNPvJ4a2YLKR53rwYGfdRqKhm/\nMOjF7WXfZpp4h4dw8/yziENLFR0otZBLXxLNG5mZAoGBAPd34MJZddkJQs5ACQ8I\n01ZMsJ3725zhYnJrIdZ4LG0y6p0zr6bKEQYmFfz2/A1uzCTSNgE+W0XkmSq7LQts\nvvt1SrpR6EVrdWSoGSaSCrAzemYZcYs8UDlQIIAiMPO5Kvbc8qO0EaI6qHyIakCG\nCn/kf/kbYo3srwTjc5UrzDss\n-----END PRIVATE KEY-----\n",
    "client_email": "firebase-adminsdk-s3fgj@health-care-chat-7f677.iam.gserviceaccount.com",
    "client_id": "100850814480349776196",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-s3fgj%40health-care-chat-7f677.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  };

  List<String> scopes = [
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/firebase.database",
    "https://www.googleapis.com/auth/firebase.messaging"
  ];

  http.Client client = await auth.clientViaServiceAccount(
    auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
    scopes,
  );

  // Obtain the access token
  auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client
  );

  // Close the HTTP client
  client.close();

  // Return the access token
  return credentials.accessToken.data;

}

Future<void> sendFCMMessage({required String FCMToken,required String title,required String body}) async {
  final String serverKey = await getAccessToken() ; // Your FCM server key
  final String fcmEndpoint = 'https://fcm.googleapis.com/v1/projects/health-care-chat-7f677/messages:send';
  final  currentFCMToken = await FirebaseMessaging.instance.getToken();
  print("fcmkey : $FCMToken");
  print("title : $title");
  print("body : $body");

  final Map<String, dynamic> message = {
    'message': {
      'token': FCMToken, // Token of the device you want to send the message to
      'notification': {
        'body': body,
        'title': title
      },
      'data': {
        'current_user_fcm_token': currentFCMToken, // Include the current user's FCM token in data payload
      },
    }
  };

  final http.Response response = await http.post(
    Uri.parse(fcmEndpoint),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $serverKey',
    },
    body: jsonEncode(message),
  );

  if (response.statusCode == 200) {
    print('FCM message sent successfully');
  } else {
    print('Failed to send FCM message: ${response.statusCode}');
  }
}
void call(path) async
{

  final Uri tel = Uri(
    scheme: 'tel',
    path: path.toString(),

  );  await launchUrl(tel,mode:  LaunchMode.platformDefault);
}