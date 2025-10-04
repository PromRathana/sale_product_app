import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_product_app/features/home/view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var homeViewModel = Get.put(HomeViewModel());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
