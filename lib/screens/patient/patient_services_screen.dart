import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_mate/screens/patient/patient_addresses_screen.dart';
import 'package:health_mate/screens/patient/first_aid.dart';

import '../../bloc/patient/user_cubit.dart';


class PatientServicesPage extends StatelessWidget {
  const PatientServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFDCEEEB),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        systemOverlayStyle:  SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Color(0XFFDCEEEB),
          // statusBarColor: Color(0xffFCE36E).withOpacity(0.70),
          systemNavigationBarDividerColor:  Colors.black,
          systemNavigationBarColor: Colors.black,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness:
          Brightness.light, // For iOS (dark icons)// For iOS (dark icons)
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Services',
          style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w900
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FirstAidPage();
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/firstaid.jpeg'),
                  ),
                ),
                height: 250,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'First Aid',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: () {
                UserCubit.get(context).getHospitalAddresses();
                UserCubit.get(context).getPharmacyAddresses();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PatientAddressesPage();
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/Hospital.jpg'),
                  ),
                ),
                height: 250,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Addresses',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
