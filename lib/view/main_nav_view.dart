import 'package:flutter/material.dart';
import 'package:flutter_hungry_hub/view/home_view.dart';
import 'package:flutter_hungry_hub/view/orders_view.dart';
import 'package:flutter_hungry_hub/view/profile_view.dart';
import 'package:flutter_hungry_hub/view/menu_view.dart';
import 'package:flutter_hungry_hub/view_model/main_nav_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/common/image_extention.dart';

class MainNavView extends StatelessWidget {
  final int initialIndex;

  const MainNavView({super.key, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainNavViewModel());
    return DefaultTabController(
      length: 4,
      initialIndex: initialIndex,
      child: Scaffold(
        key: controller.scaffoldKey,
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(), // Tắt vuốt giữa các tab
          children: [
            HomeView(),
            MenuView(),
            OrdersView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TabController tabController = DefaultTabController.of(context);
    final controller = Get.find<MainNavViewModel>();

    return Obx(() {
      return Stack(
        children: [
          Container(
            height: 115,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5,
                  offset: Offset(0, -3),
                )
              ],
            ),
            child: BottomAppBar(
              color: Colors.white,
              elevation: 0,
              child: TabBar(
                controller: tabController,
                onTap: (index) => controller.updateSelectedTab(index),
                indicator: const BoxDecoration(),
                indicatorColor: Colors.transparent,
                labelColor: const Color(0xFFD42323),
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: const TextStyle(fontSize: 14),
                tabs: [
                  _buildTab(
                    "Home",
                    controller.selectedTab.value == 0
                        ? ImageAsset.home
                        : ImageAsset.homeUn,
                  ),
                  _buildTabPNG(
                    "Menu",
                    controller.selectedTab.value == 1
                        ? ImageAsset.menu
                        : ImageAsset.menuUnn,
                  ),
                  _buildTab(
                    "Order",
                    controller.selectedTab.value == 2
                        ? ImageAsset.orderUn
                        : ImageAsset.order,
                  ),
                  _buildTab(
                    "Profiles",
                    controller.selectedTab.value == 3
                        ? ImageAsset.userUn
                        : ImageAsset.user,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 14,
              color: Colors.white, // Đường bo viền
            ),
          ),
        ],
      );
    });
  }

  Tab _buildTab(String label, String iconPath) {
    return Tab(
      text: label,
      icon: SvgPicture.asset(
        iconPath,
        width: 24,
        height: 24,
      ),
    );
  }

  Tab _buildTabPNG(String label, String iconPath) {
    return Tab(
      text: label,
      icon: Image.asset(
        iconPath,
        width: 30,
        height: 30,
      ),
    );
  }
}
