// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:banking_app/transferMoney.dart';
import 'package:provider/provider.dart';
import 'package:banking_app/providers/providerMoney.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
    
  }
}

class homePage extends StatefulWidget {
  const homePage({ Key? key }) : super(key: key);
  @override
  _homePageState createState() => _homePageState();
}


class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('asset/images/logo.png'),
                        )
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text("MK Bank", style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'ubuntu',
                      fontSize: 25
                    ),)
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Text("Account Overview", style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              fontFamily: 'avenir'
            ),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFFE0F7FA),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Provider.of<Amount>(context).getsavings.toString(), style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700
                      ),),
                      SizedBox(height: 5,),
                      Text("Current Balance", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                      ),)
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffffac30)
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Send Money", style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'avenir'
                ),),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/images/scanqr.png')
                    )
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffffac30),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 40,
                      
                    ),
                  ),
                  IconButton(
                    icon: Image.asset('asset/images/avatar1.png',scale: 0.4),
                    iconSize: 60,
                    onPressed: (){
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const transfermoney()
                        ),
                        );
                      });
                    }
                  ),
                  IconButton(
                    icon: Image.asset('asset/images/avatar2.png', scale: 0.4,),
                    iconSize: 60,
                    onPressed: (){
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const transfermoney()
                        ),
                        );
                      });
                    },
                  ),
                  IconButton(
                    icon: Image.asset('asset/images/avatar3.png', scale: 0.4),
                    iconSize: 60,
                    onPressed: (){
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const transfermoney()
                        ),
                        );
                      });
                    },
                  ),
                  IconButton(
                    icon: Image.asset('asset/images/avatar4.png',scale: 0.4),
                    iconSize: 60,
                    onPressed: (){
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const transfermoney()
                        ),
                        );
                      });
                    },
                    
                  ),
               
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Services', style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'avenir'
                ),),
                Container(
                  height: 60,
                  width: 60,
                  child: Icon(Icons.dialpad),
                )
              ],
            ),
            Expanded(
              child:GridView.count(crossAxisCount: 4,
                childAspectRatio: 0.7,
                children: [
                  serviceWidget("sendMoney", "Send\nMoney"),
                  serviceWidget("receiveMoney", "Receive\nMoney"),
                  serviceWidget("phone", "Mobile\nRecharge"),
                  serviceWidget("electricity", "Electricity\nBill"),
                  serviceWidget("tag", "Cashback\nOffer"),
                  serviceWidget("movie", "Movie\nTicket"),
                  serviceWidget("flight", "Flight\nTicket"),
                  serviceWidget("cash-inadvance", "Cash-In\nAdvance"),
                  serviceWidget("waterbill", "Water\nBill"),
                  serviceWidget("deposit", "Deposit\n"),
                  serviceWidget("savings", "Savings\n"),
                  serviceWidget("more", "More\n"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Column serviceWidget(String img, String name)
  {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFFE0F7FA),
              ),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/images/$img.png')
                    )
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5,),
        Text(name, style: TextStyle(
          fontFamily: 'avenir',
          fontSize: 14,
        ),textAlign: TextAlign.center,)
      ],
    );
  }
  Container avatarWidget(String img, String name)
  {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 150,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color(0xfff1f3f6)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('asset/images/$img.png'),
                fit: BoxFit.contain
              ),
              border: Border.all(
                color: Colors.black,
                width: 2
              )
            ),
          ),
          Text(name, style: TextStyle(
            fontSize: 16,
            fontFamily: 'avenir',
            fontWeight: FontWeight.w700
          ),)
        ],
      ),
    );
  }
}

