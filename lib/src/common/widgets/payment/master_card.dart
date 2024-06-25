import 'package:flutter/material.dart';
import 'package:servy_app/src/utils/constants/images.dart';

Card buildCreditCard({
  required Color color,
  required String cardNumber,
  required String cardHolder,
  required String cardExpiration,
}) {
  return Card(
    elevation: 4.0,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    child: Container(
      height: 230,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'ARAB BANK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                ),
              ),
              Image.asset(
                TImages.masterCard,
                height: 60,
                width: 60,
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                TImages.chip,
                height: 50,
                width: 60,
              ),
              const SizedBox(width: 8),
              Image.asset(
                TImages.contactLess,
                height: 30,
                width: 30,
              ),
            ],
          ),
          Text(
            cardNumber,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
              letterSpacing: 4,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildDetailsBlock(
                label: 'CARDHOLDER',
                value: cardHolder,
              ),
              buildDetailsBlock(label: 'VALID THRU', value: cardExpiration),
            ],
          ),
        ],
      ),
    ),
  );
}

Column buildDetailsBlock({required String label, required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
      ),
      Text(
        value,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: .5,
        ),
      )
    ],
  );
}
