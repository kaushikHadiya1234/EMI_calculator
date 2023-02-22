import 'dart:math';

import 'package:flutter/material.dart';

class EMI extends StatefulWidget {
  const EMI({Key? key}) : super(key: key);

  @override
  State<EMI> createState() => _EMIState();
}

class _EMIState extends State<EMI> {
  double amount = 500000;
  double rate = 8;
  double year = 2;
  double I = 0;
  double tpay = 0;
  double emi = 0;
 TextEditingController txtamount=TextEditingController(text: "500000");
 TextEditingController txtrate=TextEditingController(text: "8");
 TextEditingController txtyear=TextEditingController(text: "2");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EMI",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.cyan,
        centerTitle: true,
        leading:
            Icon(Icons.account_balance_outlined, size: 25, color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.account_circle_rounded,
                size: 25, color: Colors.black),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.cyan),
                  child: Icon(Icons.home, size: 60),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    Container(
                      height: 320,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 20, right: 30),
                                child: Text(
                                  "Home Loan Amount",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 150,
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: txtamount,
                                  style: TextStyle(
                                    fontSize: 20,color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black,width: 1),
                                    ),
                                    prefixIcon: Icon(Icons.currency_rupee_sharp),
                                    enabledBorder: UnderlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      amount = double.parse(value);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Slider(
                            value: amount,
                            divisions: 10,
                            label: "$amount",
                            max: 5000000,
                            activeColor: Colors.red[900],
                            onChanged: (value) {
                              setState(() {
                                amount = value;
                                txtamount=TextEditingController(text: "\$ ${amount.toInt()}");
                              });
                            },
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 20, right: 30),
                                child: Text(
                                  "Interest Rate",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 60,
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: txtrate,
                                  style: TextStyle(
                                    fontSize: 20,color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black,width: 1),
                                    ),
                                    suffixIcon: Icon(Icons.percent),
                                    enabledBorder: UnderlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    setState(() {rate = double.parse(value);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Slider(
                            value: rate,
                            max: 15,
                            divisions: 15,
                            label: "$rate",
                            activeColor: Colors.red[900],
                            onChanged: (value) {
                              setState(() {
                                rate = value;
                                txtrate=TextEditingController(text: "${rate.toInt()}");
                              });
                            },
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 20, right: 30),
                                child: Text(
                                  "Loan Tenure (year)",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 70,
                                alignment: Alignment.center,
                                child: TextField(
                                  controller: txtyear,
                                  style: TextStyle(
                                    fontSize: 20,color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black,width: 1),
                                    ),
                                    suffixIcon: Icon(Icons.timelapse_outlined),
                                    enabledBorder: UnderlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    setState(() {year = double.parse(value);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Slider(
                            value: year,
                            max: 10,
                            divisions: 10,
                            label: "$year",
                            activeColor: Colors.red[900],
                            onChanged: (value) {
                              setState(() {
                                year = value;
                                txtyear=TextEditingController(text: "${year.toInt()}");
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // P x R x (1+R)^N / [(1+R)^N-1]
                            //  A = (P * r * pow((1+r), n) / ( pow((1+r),n) -1));
                            // emi = (amount * rate * pow((1+rate),month) / ( pow((1+rate), month)-1));
                            I = (amount * rate * year) / 100;
                            tpay = amount + I;
                            emi = tpay / (12 * year);
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "Conform",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Loan EMI",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.purpleAccent,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(Icons.currency_rupee_sharp),
                             Text(
                               "$emi",
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 30,
                                 color: Colors.black,
                               ),
                             ),
                           ],
                         ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Interest Payable",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.purpleAccent,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.currency_rupee_sharp),
                              Text(
                                "$I",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Total Payable Amount",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.purpleAccent,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.currency_rupee_sharp),
                              Text(
                                "$tpay",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
