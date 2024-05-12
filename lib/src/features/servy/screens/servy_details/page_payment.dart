import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:servy_app/src/common/widgets/payment/card_alert_dialog.dart';
import 'package:servy_app/src/common/widgets/payment/card_input_formatter.dart';
import 'package:servy_app/src/common/widgets/payment/card_month_input_formatter.dart';
import 'package:servy_app/src/common/widgets/payment/master_card.dart';
import 'package:servy_app/src/common/widgets/payment/my_painter.dart';
import 'package:servy_app/src/utils/constants/colors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _HomePageState();
}

class _HomePageState extends State<PaymentPage> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderNameController =
      TextEditingController();
  final TextEditingController cardExpiryDateController =
      TextEditingController();
  final TextEditingController cardCvvController = TextEditingController();

  final FlipCardController flipCardController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                FlipCard(
                    fill: Fill.fillFront,
                    direction: FlipDirection.HORIZONTAL,
                    controller: flipCardController,
                    onFlip: () {},
                    flipOnTouch: true,
                    onFlipDone: (isFront) {},
                    front: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: buildCreditCard(
                        color: TColors.primaryColor,
                        cardExpiration: cardExpiryDateController.text.isEmpty
                            ? "08/2025"
                            : cardExpiryDateController.text,
                        cardHolder: cardHolderNameController.text.isEmpty
                            ? "Card Holder"
                            : cardHolderNameController.text.toUpperCase(),
                        cardNumber: cardNumberController.text.isEmpty
                            ? "XXXX XXXX XXXX XXXX"
                            : cardNumberController.text,
                      ),
                    ),
                    back: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        elevation: 4.0,
                        color: TColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Container(
                          height: 230,
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 22.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height: 0),
                              const Text(
                                'https://www.arabbank.com',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 11,
                                ),
                              ),
                              Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width / 1.2,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              CustomPaint(
                                painter: MyPainter(),
                                child: SizedBox(
                                  height: 35,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        cardCvvController.text.isEmpty
                                            ? "322"
                                            : cardCvvController.text,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 21,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'This card may only be used by an authorized signatory and subject to the current team and condition of use.',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 11,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                const SizedBox(height: 40),
                TextFormField(
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Card Number',
                    prefixIcon: Icon(
                      Icons.credit_card,
                      color: TColors.primaryColor,
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                    CardInputFormatter(),
                  ],
                  onChanged: (value) {
                    var text = value.replaceAll(RegExp(r'\s+\b|\b\s'), ' ');
                    setState(() {
                      cardNumberController.value = cardNumberController.value
                          .copyWith(
                              text: text,
                              selection:
                                  TextSelection.collapsed(offset: text.length),
                              composing: TextRange.empty);
                    });
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: cardHolderNameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: TColors.primaryColor,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      cardHolderNameController.value =
                          cardHolderNameController.value.copyWith(
                              text: value,
                              selection:
                                  TextSelection.collapsed(offset: value.length),
                              composing: TextRange.empty);
                    });
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: cardExpiryDateController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'MM/YY',
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: TColors.primaryColor,
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                          CardDateInputFormatter(),
                        ],
                        onChanged: (value) {
                          var text =
                              value.replaceAll(RegExp(r'\s+\b|\b\s'), ' ');
                          setState(() {
                            cardExpiryDateController.value =
                                cardExpiryDateController.value.copyWith(
                                    text: text,
                                    selection: TextSelection.collapsed(
                                        offset: text.length),
                                    composing: TextRange.empty);
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: TextFormField(
                        controller: cardCvvController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'CVV',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: TColors.primaryColor,
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        onTap: () {
                          setState(() {
                            Future.delayed(const Duration(milliseconds: 300),
                                () {
                              flipCardController.toggleCard();
                            });
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            int length = value.length;
                            if (length == 4 || length == 9 || length == 14) {
                              cardNumberController.text = '$value ';
                              cardNumberController.selection =
                                  TextSelection.fromPosition(
                                      TextPosition(offset: value.length + 1));
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20 * 3),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Future.delayed(const Duration(milliseconds: 300), () {
                        showDialog(
                            context: context,
                            builder: (context) => const CardAlertDialog());
                        cardCvvController.clear();
                        cardExpiryDateController.clear();
                        cardHolderNameController.clear();
                        cardNumberController.clear();
                        flipCardController.toggleCard();
                      });
                    },
                    child: Text(
                      'Add Card'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
