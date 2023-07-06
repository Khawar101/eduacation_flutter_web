import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      cardType: CardType.visa,
      backgroundImage: 'assets/images/credit_card.png',
      height: 170,
      width: 280,
      cardNumber: "2255 1122 3344 5555",
      expiryDate: "07/27",
      cardHolderName: "Rehan Ullah",
      isHolderNameVisible: true,
      cvvCode: "527",
      showBackView: false,
      onCreditCardWidgetChange:
          (CreditCardBrand) {}, //true when you want to show cvv(back) view
    );
  }
}
