import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prettyrini/core/const/image_path.dart';
import 'package:prettyrini/core/global_widegts/custom_text.dart';

class PaymentPage extends StatefulWidget {
  final VoidCallback onContinue;

  PaymentPage({required this.onContinue});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCardField(),
                  _buildInputField(
                      'Expiry date', _expiryController, 'Enter expire date'),
                  _buildInputField('CVV', _cvvController, 'Enter your Cvv'),
                  _buildInputField(
                      'Address', _addressController, 'Enter your country name'),
                  SizedBox(height: 20),
                  _buildProductSummary(),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.onContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        normalText(
          text: 'Card number',
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: _cardController,
          decoration: InputDecoration(
            hintText: '0000 - 0000 - 0000',
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Image.asset(ImagePath.alert, width: 30, height: 20),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Image.asset(ImagePath.alert, width: 30, height: 20),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset(ImagePath.alert, width: 30, height: 20),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildInputField(
      String label, TextEditingController controller, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        normalText(
          text: label,
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildProductSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingText(
          text: 'Product Summary',
        ),
        SizedBox(height: 15),
        _buildSummaryItem('Green Man Jacket', '\$49'),
        _buildSummaryItem('Green Man Jacket', '\$49'),
        Divider(color: Colors.grey[300]),
        _buildSummaryItem('Total Price', '\$90', isTotal: true),
        _buildSummaryItem('Total Price (Shipping Discount)', '-\$20',
            isDiscount: true),
        _buildSummaryItem('Tax & Fee', '\$10'),
        Divider(color: Colors.grey[300]),
        _buildSummaryItem('Total Price', '\$80', isTotal: true),
      ],
    );
  }

  Widget _buildSummaryItem(String title, String price,
      {bool isTotal = false, bool isDiscount = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          smallText(
            text: title,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
          ),
          smallText(
            text: price,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
            color: isDiscount ? Colors.red : Colors.black87,
          ),
        ],
      ),
    );
  }
}

// Confirmation Page
