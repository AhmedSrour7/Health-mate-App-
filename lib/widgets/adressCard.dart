import 'package:flutter/material.dart';

class address extends StatefulWidget {
  const address({super.key});

  @override
  State<address> createState() => _addressState();
}

class _addressState extends State<address> {
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Color(0xff8c8c8c),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6,
                            spreadRadius: 1,
                            offset: Offset(3, 3))
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.apartment,
                            color: Color(0xff8c8c8c),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text("Address", style: TextStyle(
                                color: Color(0xff8c8c8c), fontSize: 18),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 30,
                        width: 320,
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffd9dada),
                              hintText: "Country"),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                          height: 30,
                          width: 320,
                          child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffd9dada),
                                hintText: "Region"),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                          height: 30,
                          width: 320,
                          child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffd9dada),
                                hintText: "City"),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                          height: 30,
                          width: 320,
                          child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffd9dada),
                                  hintText: "Street"))),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              );
  }
}