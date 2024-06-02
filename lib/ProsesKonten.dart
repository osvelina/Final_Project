
import 'package:flutter/material.dart';

class ProsesKonten extends StatelessWidget {
  const ProsesKonten({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              _buildProductPurchaseCard(
                status: 'Menunggu Pembayaran',
                products: ['Pomade Clay'],
                date: '01 Desember 2023',
                location: 'Balige',
                price: 120000,
                onTapPay: () {
                  
                  print('Pembayaran ditekan');
                },
                onTapDetail: null, 
                onTapGet: null,   
              ),
              SizedBox(height: 20),
              _buildProductPurchaseCard(
                status: 'Proses',
                products: ['Powder Rambut'],
                date: '09 April 2023',
                location: 'Samosir',
                price: 75000,
                onTapPay: null,    
                onTapDetail: () {
                  
                  print('Detail ditekan');
                },
                onTapGet: null,    
              ),
               SizedBox(height: 20),
              _buildProductPurchaseCard(
                status: 'Proses',
                products: ['Laptop'],
                date: '09 April 2023',
                location: 'Jakarta',
                price: 75000,
                onTapPay: null,    
                onTapDetail: null,
                onTapGet: () {
                  print('Terima Pesanan ditekan');
                }   
              ),
              SizedBox(height: 20),
           
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookingCard({
    required String title,
    required String date,
    required int price,
    required String status,
    required VoidCallback? onTapPay,
    required VoidCallback? onTapDetail,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _getStatusColor(status),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rp$price'),
                if (onTapPay != null)
                  ElevatedButton(
                    onPressed: onTapPay,
                    child: Text('Pembayaran'),
                  ),
                if (onTapDetail != null) SizedBox(width: 8),
                if (onTapDetail != null)
                  ElevatedButton(
                    onPressed: onTapDetail,
                    child: Text('Detail'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
     
      case 'Proses':
        return Colors.yellow;
      case 'Menunggu Pembayaran':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }

  Widget _buildProductPurchaseCard({
    required String status,
    required List<String> products,
    required String date,
    required String location,
    required int price,
    required VoidCallback? onTapPay,
    required VoidCallback? onTapDetail,
    required VoidCallback? onTapGet,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _getStatusColor(status),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var product in products)
                  Text(
                    product,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                Text(date, style: TextStyle(fontSize: 12)),
                Text(location),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (onTapPay != null)
                  ElevatedButton(
                    onPressed: onTapPay,
                    child: Text('Pembayaran'),
                  ),
                if (onTapDetail != null) SizedBox(width: 8),
                if (onTapDetail != null)
                  ElevatedButton(
                    onPressed: onTapDetail,
                    child: Text('Detail'),
                  ),
                if (onTapGet != null) SizedBox(width: 8),
                if (onTapGet != null)
                  ElevatedButton(
                    onPressed: onTapGet,
                    child: Text('Terima Pesanan'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

