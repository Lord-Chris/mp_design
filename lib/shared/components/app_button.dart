import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/_constants.dart';
import 'app_loader.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final Color? labelColor, buttonColor, borderColor, disabledColor;
  final double? width, height, borderRadius, labelSize;
  final bool isCollapsed, isDisabled;
  final bool hasShadow, hasBorder, isBusy, showFeedback;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry? padding;
  final Widget? customChild, prefixWidget, suffixWidget;
  const AppButton({
    Key? key,
    this.onTap,
    this.width,
    this.height,
    this.customChild,
    this.buttonColor = AppColors.brandColor1,
    required this.label,
    this.labelColor = AppColors.white,
    this.disabledColor,
    this.borderColor,
    this.isCollapsed = false,
    this.hasShadow = false,
    this.hasBorder = false,
    this.isBusy = false,
    this.isDisabled = false,
    this.showFeedback = true,
    this.fontWeight = FontWeight.w600,
    this.borderRadius,
    this.padding,
    this.labelSize,
    this.prefixWidget,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? (isCollapsed ? null : double.maxFinite),
      height: height ?? (isCollapsed ? null : 50.h),
      child: MaterialButton(
        onPressed: isDisabled ? null : onTap,
        disabledColor: disabledColor ?? buttonColor?.withOpacity(0.3),
        color: buttonColor,
        elevation: hasShadow ? 5 : 0,
        clipBehavior: Clip.hardEdge,
        splashColor: showFeedback ? null : buttonColor,
        highlightColor: showFeedback ? null : buttonColor,
        highlightElevation: showFeedback ? 4 : 0,
        padding: padding ?? EdgeInsets.all(10.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 5.r),
          side: hasBorder
              ? BorderSide(
                  color: borderColor ?? Colors.grey[400]!,
                  width: 1.r,
                )
              : BorderSide.none,
        ),
        child: Builder(
          builder: (context) {
            if (isBusy) {
              return SizedBox.square(
                child: FittedBox(
                  child: AppLoader(
                    padding: 15,
                    color: labelColor,
                  ),
                ),
              );
            }

            if (customChild != null) return customChild!;

            return FittedBox(
              child: Row(
                children: [
                  if (prefixWidget != null)
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: prefixWidget,
                    ),
                  Center(
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.medium14.copyWith(
                        fontSize: labelSize?.spMin,
                        fontWeight: fontWeight,
                        color: labelColor,
                      ),
                    ),
                  ),
                  if (suffixWidget != null)
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: suffixWidget,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
