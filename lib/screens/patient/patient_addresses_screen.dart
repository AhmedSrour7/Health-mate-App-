import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/widgets/address_card.dart';
import 'package:health_mate/widgets/searchBar.dart';
import '../../bloc/patient/user_cubit.dart';
import '../../bloc/patient/user_state.dart';


class PatientAddressesPage extends StatefulWidget {
  const PatientAddressesPage({super.key});

  @override
  State<PatientAddressesPage> createState() => _PatientAddressesPageState();
}

class _PatientAddressesPageState extends State<PatientAddressesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        UserCubit cubit = UserCubit.get(context);

        return Scaffold(
          backgroundColor: const Color(0XFFDCEEEB),
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0XFFDCEEEB),
              systemNavigationBarDividerColor: Colors.black,
              systemNavigationBarColor: Colors.black,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: const Text(
              'Services Address',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            elevation: 0,
            bottom: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Hospital'),
                Tab(text: 'Pharmacy'),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              Column(
                children: [
                  const SizedBox(height: 10),
                  searchBarHospital(),
                  const SizedBox(height: 10),
                  cubit.hospitalModel != null
                      ? cubit.hospitalModel!.data!.isNotEmpty
                          ? Expanded(
                              child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: ListView.separated(
                                itemBuilder: (context, index) => AddressCard(
                                  title:
                                      cubit.hospitalModel!.data?[index].name ?? "",
                                  subTitle:
                                      "${cubit.hospitalModel!.data?[index].region ?? ""} , ${cubit.hospitalModel!.data?[index].city ?? ""} , ${cubit.hospitalModel!.data?[index].street ?? ""}",
                                ),
                                shrinkWrap: true,
                                itemCount: cubit.hospitalModel!.data!.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 15),
                              ),
                            ))
                          : Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Center(
                                      child: Text(
                                    "No hospital Found",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ))))
                      : Expanded(
                          child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Center(child: CircularProgressIndicator()),
                        ))
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  searchBarParmachy(),
                  const SizedBox(height: 10),
                  cubit.pharmacyModel != null
                      ? cubit.pharmacyModel!.data!.isNotEmpty
                          ? Expanded(
                              child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: ListView.separated(
                                itemBuilder: (context, index) => AddressCard(
                                  title:
                                      cubit.pharmacyModel!.data?[index].name ?? "",
                                  subTitle:
                                      "${cubit.pharmacyModel!.data?[index].region ?? ""} , ${cubit.pharmacyModel!.data?[index].city ?? ""} , ${cubit.pharmacyModel!.data?[index].street ?? ""}",
                                ),
                                shrinkWrap: true,
                                itemCount: cubit.pharmacyModel!.data!.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 15),
                              ),
                            ))
                          : Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Center(
                                    child: Text("No pharmacy Found",style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),),
                                  )))
                      : Expanded(
                          child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Center(child: CircularProgressIndicator()),
                        ))
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
