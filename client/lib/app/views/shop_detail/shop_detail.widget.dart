import 'package:client/app/views/shop_detail/shop_detail.viewmodel.dart';
import 'package:client/app/views/shop_detail/widget/offer_box.dart';
import 'package:client/app/views/shop_detail/widget/tabbar_view/face_care.dart';
import 'package:client/app/views/shop_detail/widget/tabbar_view/packages.dart';
import 'package:client/app/views/shop_detail/widget/tabbar_view/recommended.dart';
import 'package:client/app/widgets/buttons/buttons_widgets.dart';

import 'package:client/app/widgets/divider/divider_widgets.dart';
import 'package:client/app/widgets/inputs/widgets/shop_cards/shop_card_widgets.dart';
import 'package:client/core/constans/color_constants.dart';
import 'package:client/core/constans/text_constants.dart';
import 'package:client/core/extensions/common_extension.dart';
import 'package:client/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/image_viewer/icons/icons_widgets.dart';

class ShopDetailWidgets {
  Widget shopDetailAppBar(
      BuildContext context, String shopName, String address, String shopTypes, double rating, double? discountAmount) {
    return Stack(
      children: [
        SizedBox(width: context.width, child: Image.asset(Assets.images.shop.homeShop1.path, fit: BoxFit.cover)),
        BackButton(
          color: ColorConstant.instance.light4,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Padding(
          padding: context.paddingNormal,
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShopCardWidgets()
                      .shopInformation(context, shopName, shopTypes, rating, address, discountAmount, true),
                  CustomIcon(
                      imagePath: "assets/icons/heart.png",
                      height: IconSize.large,
                      width: IconSize.large,
                      iconColor: ColorConstant.instance.light4),
                ],
              )),
        ),
      ],
    );
  }

  Widget shopDetailBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          CustomIcon(
                              imagePath: "assets/icons/phone.png", height: IconSize.large, width: IconSize.large),
                          Text("Call")
                        ],
                      ),
                      Column(
                        children: const [
                          CustomIcon(
                              imagePath: "assets/icons/pin-outline.png", height: IconSize.large, width: IconSize.large),
                          Text("Directions")
                        ],
                      ),
                      Column(
                        children: const [
                          CustomIcon(
                              imagePath: "assets/icons/share.png", height: IconSize.large, width: IconSize.large),
                          Text("Share")
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomOutlinedButton(
                        borderSideColor: ButtonColor.dark,
                        onPressed: () {},
                        buttonSize: ButtonSize.small,
                        child: Row(children: const [Icon(Icons.star_border_outlined), Text("4.1")]),
                      ),
                      Text(
                        "5k + ratings",
                        style: TextConstants.instance.label2.copyWith(color: ColorConstant.instance.blue2),
                      )
                    ],
                  ),
                )
              ],
            ),
            context.emptySizedHeightBoxLow,
            const CustomDivider(type: DividerType.dashed),
            context.emptySizedHeightBoxLow,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const OfferBoxWidget(),
                context.emptySizedWidthBoxLow,
                const OfferBoxWidget(),
              ],
            ),
            const Divider(thickness: 5.0),
            buildTabbar(context),
            context.emptySizedHeightBoxNormal,
            buildTabbarView(context),
          ],
        ),
      ),
    );
  }

  Widget buildTabbarView(BuildContext context) {
    final provider = Provider.of<ShopDetailViewModel>(context);

    switch (provider.selectedTab) {
      case "Recommended":
        return const RecommendedView();
      case "Packages":
        return const PackagesView();
      case "Face Care":
        return const FaceCareView();
      default:
        return const SizedBox();
    }
  }

  // ignore: non_constant_identifier_names
  Widget buildTabbar(BuildContext context) {
    final provider = Provider.of<ShopDetailViewModel>(context);

    List<String> list = ["Recommended", "Packages", "Face Care", "Packages"];

    return SizedBox(
      height: context.dynamicHeight(0.06),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              InkWell(
                onTap: () {
                  provider.selectedTab = list[index];
                },
                child: Chip(
                  backgroundColor: ColorConstant.instance.light2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  label: Text(
                    list[index],
                    style: TextStyle(
                      color: provider.selectedTab == list[index]
                          ? ColorConstant.instance.purple2
                          : ColorConstant.instance.dark3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              context.emptySizedWidthBoxNormal,
            ],
          );
        },
      ),
    );
  }
}