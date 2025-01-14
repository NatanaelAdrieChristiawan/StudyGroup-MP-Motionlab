import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  // Fungsi untuk generate invoice number
  String generateInvoiceNumber() {
    final random = DateTime.now().millisecondsSinceEpoch.remainder(1000000);
    return random.toString().padLeft(10, '0');
  }

  @override
  Widget build(BuildContext context) {
    // Ambil total harga dari arguments
    final double totalPrice = Get.arguments ?? 0.0;

    final String transactionDate =
        DateFormat('dd MMMM yyyy').format(DateTime.now());
    final String invoiceNumber = generateInvoiceNumber();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInvoiceCard(invoiceNumber, transactionDate, totalPrice),
            const SizedBox(height: 20),
            _buildDetailPesanan(totalPrice),
            const SizedBox(height: 40),
            _buildBackToHomeButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInvoiceCard(
      String invoiceNumber, String transactionDate, double totalPrice) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.green[100],
            child: const Icon(Icons.check, color: Colors.green, size: 30),
          ),
          const SizedBox(height: 10),
          const Text("Transaction Success",
              style: TextStyle(fontSize: 18, color: Colors.black54)),
          Text("\$${totalPrice.toStringAsFixed(2)}",
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildTransactionRow("Invoice Number", invoiceNumber),
          _buildTransactionRow("Transaction Date", transactionDate),
          _buildTransactionRow("Payment Method", "Bank Transfer"),
        ],
      ),
    );
  }

  Widget _buildDetailPesanan(double totalPrice) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Detail Pesanan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildTransactionRow("Order Name", "Natanael Adrie Christiawan"),
          _buildTransactionRow("Order Email", "natanaelac04@gmail.com"),
          _buildTransactionRow(
              "Total Price", "\$${totalPrice.toStringAsFixed(2)}"),
        ],
      ),
    );
  }

  Widget _buildTransactionRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildBackToHomeButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.offAllNamed('/');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00623B),
        padding: const EdgeInsets.all(16),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text("Back to Home",
          style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}