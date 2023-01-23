import 'package:client/app/l10n/app_l10n.dart';
import 'package:client/app/views/home/home.viewmodel.dart';
import 'package:client/app/widgets/custom_appbar.dart';
import 'package:client/app/widgets/divider/widgets/custom_divider.dart';
import 'package:client/app/widgets/image_viewer/custom_viewer_image.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:flutter/material.dart';

class BeautyServiceDetailWidgets {
  PreferredSizeWidget appbar(BuildContext context) =>
      CustomAppbar(title: L10n.of(context)!.beautyServices);

  Widget body(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingNormal,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Padding(
            padding: context.horizontalPaddingNormal,
            child: const CustomDivider(),
          );
        },
        itemCount: HomeViewModel().beautyServiceList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var key = HomeViewModel().beautyServiceList[index];

          return ListTile(
            leading: CustomImageViewer(assetPath: key['image']),
            title: Text(key['text'], style: TextConstants.instance.label1),
          );
        },
      ),
    );
  }
}