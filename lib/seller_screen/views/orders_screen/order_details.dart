import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text("Order Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Ngày order: 01/01/2022',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Phương thức thanh toán: Thẻ tín dụng',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Địa chỉ: 123 Đường ABC, TP.HCM',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text('Đang chờ', style: TextStyle(fontSize: 16)),
                    Checkbox(value: false, onChanged: (bool? value) {}),
                  ],
                ),
                Row(
                  children: [
                    Text('Đã xác nhận', style: TextStyle(fontSize: 16)),
                    Checkbox(value: false, onChanged: (bool? value) {}),
                  ],
                ),
                Row(
                  children: [
                    Text('Đang giao', style: TextStyle(fontSize: 16)),
                    Checkbox(value: false, onChanged: (bool? value) {}),
                  ],
                ),
                Row(
                  children: [
                    Text('Đã giao', style: TextStyle(fontSize: 16)),
                    Checkbox(value: false, onChanged: (bool? value) {}),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
