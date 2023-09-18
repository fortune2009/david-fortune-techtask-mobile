import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'ingredients.dart';

class LunchDateScreen extends StatefulWidget {
  @override
  _LunchDateScreenState createState() => _LunchDateScreenState();
}

class _LunchDateScreenState extends State<LunchDateScreen> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Navigator.push(
  // context,
  // MaterialPageRoute(
  // builder: (context) => IngredientsScreen(),
  // ),
  // );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lunch Date Selection'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Select Your Lunch Date:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              // "${DateFormat('dd MMMM yyyy').format(selectedDate.toLocal())}".split(' ')[0],
              "${DateFormat('dd MMMM yyyy').format(selectedDate.toLocal())}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),

            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => IngredientsScreen(),
                ),
                );
              },
              child: Text('Choose Ingredients'),
            ),
          ],
        ),
      ),
    );
  }
}
