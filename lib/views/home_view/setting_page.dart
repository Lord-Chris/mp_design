import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mp_design/shared/constants/app_colors.dart';
import 'package:mp_design/shared/constants/app_textstyles.dart';
import 'package:mp_design/shared/constants/spacing.dart';
import 'package:mp_design/views/home_view/widgets/custom_text_field.dart';

class SettingsPage extends HookWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = useTextEditingController(text: 'Tech Sis');
    final email = useTextEditingController(text: 'techsis@odogwu.com');
    final address = useTextEditingController(text: 'Flutterbytes Conf');
    final isEditing = useState(false);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.green,
        title: const Text(
          'Settings Page',
          style: TextStyle(color: AppColors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => isEditing.value = !isEditing.value,
            icon: Icon(
              isEditing.value ? Icons.save : Icons.edit,
              color: AppColors.black,
            ),
          )
        ],
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
                      child: Icon(Icons.person, size: 30),
                    ),
                  ),
                ),
                Positioned(
                  right: 130.w,
                  bottom: 15,
                  child: Visibility(
                    visible: isEditing.value,
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
                            padding: const EdgeInsets.only(bottom: 20),
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacing.vertLarge(),
            Expanded(
              child: Stack(
                children: [
                  // TODO: Exclude Semantics
                  ExcludeSemantics(
                    excluding: !isEditing.value,
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'Full name',
                          controller: name,
                        ),
                        Spacing.vertLarge(),
                        CustomTextField(
                          hintText: 'Email Address',
                          controller: email,
                        ),
                        Spacing.vertLarge(),
                        CustomTextField(
                          hintText: 'Address',
                          controller: address,
                        ),
                      ],
                    ),
                  ),
                  if (!isEditing.value)
                    Container(
                      width: double.maxFinite,
                      color: AppColors.white,
                      padding: REdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetails(
                            Icons.person,
                            'Full name:',
                            name.text,
                          ),
                          Spacing.vertRegular(),
                          _buildDetails(
                            Icons.email,
                            'Email Address:',
                            email.text,
                          ),
                          Spacing.vertRegular(),
                          _buildDetails(
                            Icons.house,
                            'Home Address:',
                            address.text,
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetails(IconData icon, String label, String value) {
    // TODO: Merge Semantics
    return MergeSemantics(
      child: Row(
        children: [
          Icon(icon),
          Spacing.horizRegular(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.bold12.copyWith(
                    color: AppColors.deepGrey,
                  ),
                ),
                Spacing.vertTiny(),
                Text(
                  value,
                  style: AppTextStyles.medium18.copyWith(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
