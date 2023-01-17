import 'package:client/app/widgets/buttons/buttons_widgets.dart';
import 'package:client/app/widgets/icons/icons_widgets.dart';
import 'package:flutter/material.dart';

class ShopPromoTile extends StatelessWidget {
  const ShopPromoTile({
    super.key,
    this.title,
    this.subtitle,
    this.buttonText,
    this.isApplied = false,
    this.isInvalid = false,
    this.promoCode,
    this.profit,
  });
  final String? title;
  final String? subtitle;
  final String? promoCode;
  final double? profit;
  final String? buttonText;
  final bool isApplied;
  final bool isInvalid;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: isApplied
          ? isInvalid
              ? false
              : true
          : false,
      leading: isApplied
          ? const CustomIcon(imagePath: '../assets/icons/input-correct.png')
          : isInvalid
              ? const CustomIcon(imagePath: '../assets/icons/input-wrong.png')
              : const CustomIcon(imagePath: '../assets/icons/offer.png'),
      title: isApplied
          ? Text(title ?? 'Code ${promoCode ?? 'FREE10'} Applied!')
          : isInvalid
              ? Text(title ?? 'Promo Code Invalid!')
              : Text(title ?? 'Offers & Promo Code'),
      subtitle: isApplied
          ? Text(subtitle ?? 'Coupon Applied Successfully')
          : isInvalid
              ? const Text('Sorry, this code works for only debit cards')
              : const SizedBox.shrink(),
      trailing: isApplied
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('-\$${profit ?? 40}'),
                CustomTextButton(
                  onPressed: () {},
                  text: 'Remove',
                  padding: EdgeInsets.zero,
                )
              ],
            )
          : isInvalid
              ? CustomTextButton(
                  onPressed: () {},
                  text: 'Try Again',
                  padding: EdgeInsets.zero,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('View offers'),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
    );
  }
}