// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:banking_app/providers/providerMoney.dart';
import 'package:provider/provider.dart';


class transfermoney extends StatefulWidget {
    const transfermoney({Key? key}) : super(key: key);

  @override
  _transferMoneyState createState() => _transferMoneyState();
}

class _transferMoneyState extends State<transfermoney> {
  TextEditingController amountTransController = TextEditingController();
  TextEditingController accountNumController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: Column
        (crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Money Transfer',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
                ),
            const SizedBox(
              height: 70.0,
              ),
              SizedBox(
                width: 250.0,
                child: TextField(
                controller: amountTransController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Amount of Money',
                fillColor: Color(0xFFF3E5F5),
                filled: true,
                ),
              ),
              ),
              const SizedBox(height: 20.0,),
              SizedBox(
              width: 250.0,
              child: TextField(
                controller: accountNumController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Account Number',
                fillColor: Color(0xFFF3E5F5),
                filled: true,
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(12),
                ],
              ),
            ),
            
             const SizedBox(height: 20.0,),
            ElevatedButton(
                onPressed: () => moneyTransfer(
                    int.parse(amountTransController.text),
                    accountNumController.text,
                    context),
                child: const Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Text('Send Money'),
                ),
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Color(0xff7d32a8)),
                    elevation: MaterialStateProperty.all(0),
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))))
                )
          ],
          ),
      ),
      


    );
    
  }
  void moneyTransfer(int amount, String accountNumber, BuildContext context) {
    int savings =
        Provider.of<Amount>(context, listen: false).getsavings;
    if (amount > savings) {
      SnackBar snackBar = SnackBar(
          content: const Text('Amount is too high!'),
          action: SnackBarAction(label: 'Close', onPressed: () {}));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (amount < 200) {
      SnackBar snackBar = SnackBar(
          content: const Text('Amount is too low!'),
          action: SnackBarAction(label: 'Close', onPressed: () {}));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      Provider.of<Amount>(context, listen: false).subSavings(amount);
        Navigator.pop(context);
    }
  }
}