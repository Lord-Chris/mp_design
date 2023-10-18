import 'package:flutter/material.dart';
import 'package:mp_design/shared/constants/app_colors.dart';
import 'package:mp_design/shared/constants/spacing.dart';
import 'package:mp_design/views/home_view/widgets/custom_text_field.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        title: const Text('Settings Page',style: TextStyle(color:
         AppColors.black),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Spacing.vertLarge(),
            Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  height: 110,
                ),
                const Center(
                    child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.green,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Color(0xFFE0E6EB),
                          child: Icon(
                            Icons.person,
                            size: 30,
                          ),
                        ))),
                Positioned(
                  right: 125,
                  bottom: 15,
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.green.withOpacity(0.6),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColors.green,
                        child: IconButton(
                          tooltip: 'Edit icon',
                          padding: EdgeInsets.only(
                            bottom: 20,
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                          color: AppColors.black,
                        ),
                        // Icon(Icons.edit),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacing.vertLarge(),
            const CustomTextField(
              hintText: 'Full name',
            ),
            Spacing.vertLarge(),
            const CustomTextField(
              hintText: 'Email Address',
            ),
            Spacing.vertLarge(),
            const CustomTextField(
              hintText: 'Address',
            ),
          ],
        ),
      ),
    );
  }
}
