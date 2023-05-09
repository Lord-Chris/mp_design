import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/_constants.dart';
import '_components.dart';

class AppNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final bool isCircular;
  final Size? size;
  final double borderRadius;
  final Widget? placeholderWidget;
  final String? placeholderAssetImage;
  final Widget? errorWidget;
  final String? errorAssetImage;

  const AppNetworkImage({
    Key? key,
    String? url,
    this.fit,
    this.isCircular = false,
    this.size = const Size.square(40),
    this.borderRadius = 0,
    this.placeholderWidget,
    this.placeholderAssetImage,
    this.errorWidget,
    this.errorAssetImage,
  })  : imageUrl = url ?? "",
        assert(url != null || placeholderAssetImage != null,
            "At least one must be set"),
        assert(placeholderWidget == null || placeholderAssetImage == null),
        assert(errorWidget == null || errorAssetImage == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return FittedBox(
        child: Container(
          height: size?.height,
          width: size?.width,
          decoration: BoxDecoration(
            borderRadius:
                isCircular ? null : BorderRadius.circular(borderRadius),
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          ),
          clipBehavior: Clip.hardEdge,
          child:
              // placeholderAssetImage!.endsWith(".svg")
              //     ? SvgPicture.asset(
              //         placeholderAssetImage!,
              //         fit: fit ?? BoxFit.contain,
              //       )
              //     :
              Image.asset(
            placeholderAssetImage!,
            fit: fit,
          ),
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      fadeInDuration: const Duration(milliseconds: 200),
      fadeOutDuration: const Duration(milliseconds: 200),
      height: size?.height,
      width: size?.width,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: size?.height,
          width: size?.width,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: AppColors.black,
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            borderRadius:
                isCircular ? null : BorderRadius.circular(borderRadius),
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        );
      },
      placeholder: (context, value) {
        if (placeholderWidget != null) {
          return placeholderWidget!;
        }
        if (placeholderAssetImage != null &&
            placeholderAssetImage!.isNotEmpty) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius:
                  isCircular ? null : BorderRadius.circular(borderRadius),
              shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            ),
            child:
                // placeholderAssetImage!.endsWith(".svg")
                //     ? SvgPicture.asset(
                //         placeholderAssetImage!,
                //         fit: fit ?? BoxFit.contain,
                //       )
                //     :
                Image.asset(
              placeholderAssetImage!,
              fit: fit,
            ),
          );
        }
        return const Center(
          child: AppLoader(
            color: AppColors.brandColor1,
          ),
        );
      },
      errorWidget: (context, error, stackTrace) {
        if (errorWidget != null) {
          return errorWidget!;
        }
        if (errorAssetImage != null && errorAssetImage!.isNotEmpty) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius:
                  isCircular ? null : BorderRadius.circular(borderRadius),
              shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            ),
            child:
                // errorAssetImage!.endsWith(".svg")
                //     ? SvgPicture.asset(
                //         errorAssetImage!,
                //         fit: fit ?? BoxFit.contain,
                //       )
                //     :
                Image.asset(
              errorAssetImage!,
              fit: fit,
            ),
          );
        }
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius:
                isCircular ? null : BorderRadius.circular(borderRadius),
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          ),
        );
      },
      //   return errorWidget ??
      //       Container(
      //         clipBehavior: Clip.hardEdge,
      //         decoration: BoxDecoration(
      //           borderRadius:
      //               isCircular ? null : BorderRadius.circular(borderRadius),
      //           shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
      //         ),
      //         child: SvgPicture.asset(AppAssets.fallbackUserProfileSvg),
      //       );
      // },
    );
  }
}
