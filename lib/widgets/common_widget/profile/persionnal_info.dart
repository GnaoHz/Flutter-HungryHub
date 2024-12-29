import 'package:flutter/material.dart';
import 'package:flutter_hungry_hub/view_model/profile_view_model.dart';
import 'package:get/get.dart';
import './edit_info.dart';
import '../../../view/sign_up_view.dart';
import '../../common/image_extention.dart';
import 'app_bar_profile.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileViewModel());

    return Scaffold(
      appBar: AppBarProfile(title: 'Personal Info'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: AssetImage(ImageAsset.users),
            ),
            const SizedBox(height: 20),
            Obx(() {
              // Dữ liệu từ controller.userData được cập nhật tự động khi thay đổi
              return Text(
                controller.userData['fullName'] ?? 'Loading...',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff111A2C),
                  fontFamily: 'Poppins',
                ),
              );
            }),
            const SizedBox(height: 5),
            Obx(() {
              return Text(
                controller.userData['email'] ?? 'Loading...',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff6C757D),
                  fontFamily: 'Poppins',
                ),
              );
            }),
            const SizedBox(height: 30),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Obx(() => _buildUserInfoTile(
                          title: 'Full Name',
                          value: controller.userData['fullName'],
                          icon: Icons.person,
                        )),
                    const Divider(),
                    Obx(() => _buildUserPhoneTile(
                          title: 'Phone',
                          icon: Icons.phone,
                          value: controller.userData['numberPhone'],
                        )),
                    const Divider(),
                    Obx(() => _buildUserInfoTile(
                          title: 'Address',
                          value: controller.userData['address'],
                          icon: Icons.location_on,
                        )),
                    const Divider(),
                    Obx(() => _buildUserInfoTile(
                          title: 'Gender',
                          value: controller.userData['sex'],
                          icon: Icons.wc,
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Thêm khoảng cách giữa Card và nút
            Align(
              alignment: Alignment.centerRight, // Căn nút sang phải
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Điều hướng đến trang EditInfoView() bằng GetX
                    Get.to(() => const EditInfoView());
                    print("Nút Edit Info được nhấn");
                  },
                  child: const Text(
                    'Edit Info',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff111A2C),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
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

  Widget _buildUserInfoTile({
    required String title,
    String? value,
    required IconData icon,
  }) {
    // Kiểm tra nếu độ dài của value lớn hơn 20 ký tự, thì cắt và thêm dấu "..."
    String displayedValue = (value != null && value.length > 12)
        ? value.substring(0, 12) + '...'
        : (value ?? 'N/A');

    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xff111A2C),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xff111A2C),
          fontFamily: 'Poppins',
        ),
      ),
      trailing: Text(
        displayedValue,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Color(0xff6C757D),
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  Widget _buildUserPhoneTile({
    required String title,
    String? value,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: const Color(0xff111A2C),
                size: 20,
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff111A2C),
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value ?? 'N/A',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xff6C757D),
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
