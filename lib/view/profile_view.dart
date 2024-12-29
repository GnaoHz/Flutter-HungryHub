import 'package:flutter/material.dart';
import 'package:flutter_hungry_hub/view/main_nav_view.dart';
import 'package:flutter_hungry_hub/view/orders_view.dart';
import 'package:flutter_hungry_hub/view/register_shop_view.dart';
import 'package:flutter_hungry_hub/view_model/profile_view_model.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/profile/addresses.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/profile/edit_pass.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/profile/favourite.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/profile/function_png.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/profile/notification.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/profile/order_tracking.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/profile/purchased.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/profile/persionnal_info.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/check_mail/check_mail2.dart';
import 'package:flutter_hungry_hub/widgets/common_widget/profile/edit_email.dart';
import '../widgets/common/image_extention.dart';
import '../widgets/common_widget/profile/function_profile.dart';
import 'login_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final controller = Get.put(ProfileViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff303030),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              )
            ],
          )),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        ImageAsset.users,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 8),
                    child: Text(
                      controller.userData['fullName']?.toString() ?? 'User',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff111A2C),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const Text(
                    'Explore the food',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff111A2C),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 16),
                    child: Container(
                      height:260,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xffF0F0F0).withOpacity(0.6)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 24, bottom: 15, left: 16, right: 20),
                          child: Column(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.to(() => const PersonalInfo());
                                  },
                                  child: FunctionProfile(
                                    image: ImageAsset.personalInfo,
                                    title: 'Personal Info',
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.to(() => const Addresses());
                                  },
                                  child: FunctionProfile(
                                    image: ImageAsset.GPS,
                                    title: 'Addresses',
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.to(() =>  OrderTracking(initialIndex: 0,));
                                  },
                                  child: FunctionProfile(
                                    image: ImageAsset.GPS,
                                    title: 'Order tracking',
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.to(() =>  EditPassView());
                                  },
                                  child: FunctionProfile(
                                    image: ImageAsset.personalInfo,
                                    title: 'Change password',
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.to(() =>  EditEmailView());
                                  },
                                  child: FunctionProfile(
                                    image: ImageAsset.personalInfo,
                                    title: 'Change email',
                                  )),
                              
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 16),
                    child: Container(
                      height: 214,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xffF0F0F0).withOpacity(0.6)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 24, bottom: 15, left: 16, right: 20),
                          child: Column(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    print('da nhan');
                                    Get.to(() => const OrdersView());
                                  },
                                  child: FunctionProfile(
                                    image: ImageAsset.cartPlus,
                                    title: 'Cart',
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.to(() => const Favourite());
                                  },
                                  child: FunctionProfile(
                                    image: ImageAsset.favourist,
                                    title: 'Favourite',
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.to(() => const NotificationPro());
                                  },
                                  child: FunctionProfile(
                                    image: ImageAsset.notification,
                                    title: 'Notification',
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Get.to(() => Purchased());
                                  },
                                  child: FunctionPng(image: ImageAsset.purchased, title: 'Purchased')),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 16),
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xffF0F0F0).withOpacity(0.6)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 24, bottom: 15, left: 16, right: 20),
                          child: Column(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.offAll(() => const LoginView());
                                  },
                                  child: FunctionPng(image: ImageAsset.logOut, title: 'Log Out'),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Get.to(()=> const RegisterShopView());
                showTermsDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffEF5350), // Màu nền nút
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Bo góc nút
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 15), // Padding cho nút
                elevation: 5, // Độ bóng của nút
              ),
              child: const Row(
                mainAxisSize:
                    MainAxisSize.min, // Đảm bảo chiều rộng của Row là nhỏ nhất
                children: [
                  Text(
                    'Shop',
                    style: TextStyle(
                        color: Colors.white, // Màu chữ
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'Poppins'),
                  ),
                  SizedBox(width: 10), // Khoảng cách giữa chữ và icon
                  Icon(
                    Icons.shop,
                    color: Colors.white, // Màu icon
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showTermsDialog(BuildContext context) {
    bool isChecked = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Account Transfer Terms and Conditions',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff111A2C),
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'At HungryHub, we are committed to providing the best shopping and selling experience for all users. '
                  'If you are a user and wish to upgrade your personal account to a Shop account to sell chicken-related products on HungryHub, please carefully read the terms and conditions below:\n\n'
                  '1. Account Conversion Conditions\n'
                  'User Account: Only accounts with the "User" status can be converted to a Shop account.\n'
                  'Verification Information: You need to provide complete information about your shop, including but not limited to the shop name, address, and contact information.\n'
                  'Owner Verification: You must prove that you are the owner of the shop you wish to register for selling products on HungryHub. This may include providing valid business documents or proof of ownership.\n\n'
                  '2. Benefits of Upgrading to a Shop Account\n'
                  'Online Selling: After conversion, you will have the right to list chicken products and other dishes for sale on the HungryHub platform.\n'
                  'Order Management: You can easily manage customer orders, track statuses, and confirm orders directly on the app.\n'
                  'Access to New Customers: With a Shop account, you can reach more customers through the HungryHub platform.\n\n'
                  '3. Account Conversion Process\n'
                  'Step 1: Log in to your current account and access the "Account Conversion" section in account settings.\n'
                  'Step 2: Provide your shop information and related documents (if any).\n'
                  'Step 3: Wait for approval from the HungryHub management team. Once approved, your account will be converted into a Shop account.\n'
                  'Step 4: After a successful conversion, you will have the right to list products and start your business on HungryHub.\n\n'
                  '4. Terms and Obligations of Shop Accounts\n'
                  'Product Quality Management: You are responsible for the quality and origin of the products you sell on HungryHub. Products must comply with food safety and legal regulations.\n'
                  'Privacy and Payment Policies: You commit to complying with the regulations on customer information security and payment processes of HungryHub.\n'
                  'Customer Service Assurance: You must respond to customer support requests related to products, delivery, and other issues arising from orders.\n\n'
                  '5. Shop Account Cancellation or Status Change Policy\n'
                  'You have the right to request the cancellation or change of your Shop account back to a User account at any time, but you must complete all current orders and ensure no violations of HungryHub’s terms.\n'
                  "HungryHub reserves the right to suspend or terminate a Shop account if there are violations of the platform's policies.\n\n"
                  '6. Support Contact\n'
                  'If you have any questions or need support during the account conversion process, please contact the HungryHub support team via email at support@hungryhub.com or phone at 123-456-789.\n',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff111A2C),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        // Cập nhật trạng thái checkbox khi người dùng tick/uncheck
                        isChecked = value!;
                        (context as Element).markNeedsBuild();
                      },
                    ),
                    const Text(
                      'I agree!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff111A2C),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog khi ấn "Hủy"
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: isChecked
                  ? () {
                      controller.transferUserDataToBrowseShop();
                      // Thực hiện hành động xác nhận khi checkbox được chọn
                      Navigator.of(context).pop(); // Đóng dialog
                      // Thực hiện chuyển tài khoản hoặc hành động cần thiết tại đây
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('The account has been transferred to the admin department!')),
                      // );
                      Get.to(() => const RegisterShopView());
                    }
                  : null, // Vô hiệu hóa nút nếu chưa đồng ý
              style: ElevatedButton.styleFrom(
                backgroundColor: isChecked
                    ? Colors.red
                    : Colors
                        .grey, // Màu nút thay đổi tùy theo trạng thái checkbox
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
                disabledBackgroundColor:
                    Colors.grey.withOpacity(0.12), // Màu khi nút bị vô hiệu hóa
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Bo tròn góc nút
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 14, horizontal: 24), // Thêm padding cho nút
              ),
              child: Text(
                'Confirm',
                style: TextStyle(
                  color: isChecked
                      ? Colors.white
                      : Colors
                          .black54, // Đổi màu chữ dựa vào trạng thái checkbox
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
