

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_cr/_doctor/home/doctorHome.dart';
import 'package:smart_cr/_doctor/home/doctorHome_ctr.dart';
import 'package:smart_cr/_doctor/patientsList/_patientsListCtr.dart';
import 'package:smart_cr/_patient/home/patientHome.dart';
import 'package:smart_cr/_patient/home/patientHome_ctr.dart';
import 'package:smart_cr/chart_live_history/chart_live_history_ctr.dart';
import 'package:smart_cr/chatSystem/chatRoomCtr.dart';
import 'package:smart_cr/manager/auth/authCtr.dart';
import 'package:smart_cr/manager/myLocale/myLocaleCtr.dart';

class GetxBinding implements Bindings {
  @override
  void dependencies() {

    Get.put<AuthController>(AuthController());


    //Get.put<PatientHomeCtr>(PatientHomeCtr());
    //Get.put<DoctorHomeCtr>(DoctorHomeCtr());
    //Get.put<ChartsCtr>(ChartsCtr());





    Get.lazyPut<ChartsCtr>(() => ChartsCtr(), fenix: true);
    Get.lazyPut<DoctorHomeCtr>(() => DoctorHomeCtr(),fenix: true);
    Get.lazyPut<PatientHomeCtr>(() => PatientHomeCtr(),fenix: true);




   // Get.lazyPut<PatientsListCtr>(() => PatientsListCtr(),fenix: true);

    Get.lazyPut<ChatRoomCtr>(() => ChatRoomCtr(),fenix: true);

    //print("## getx dependency injection completed (Get.put() )");

  }
}