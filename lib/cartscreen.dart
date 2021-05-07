import 'package:flutter/material.dart';

import 'item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
{
  List picked = [false , false];
  int totalAmount = 0;

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotalAmount();
    });
  }

  getTotalAmount() {
    var count = 0;
    for (int i = 0; i < picked.length; i++) {
      if (picked[i]) {
        count = count + 1;
      }
      if (i == picked.length - 1) {
        setState(() {
          totalAmount =  250* count;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(shrinkWrap: true, children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Stack(children: [
              Stack(children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                ),
                Container(
                  height: 300.0,
                  width: double.infinity,
                  color: Color(0xFFFDD148),
                ),
                Positioned(
                  bottom: 450.0,
                  right: 100.0,
                  child: Container(
                    height: 400.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200.0),
                      color: Color(0xFFFEE16D),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 500.0,
                  left: 150.0,
                  child: Container(
                      height: 300.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150.0),
                          color: Color(0xFFFEE16D).withOpacity(0.5))),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 15),
                child: IconButton(
                  alignment: Alignment.topLeft,
                  icon: Icon(Icons.arrow_back,
                    color: Colors.black,),
                ),),
                Positioned(
                  top: 75.0,
                    left: 15.0,
                    child: Text(
                      'Shopping Cart',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                      ),
                )),

                Padding(
                    padding: EdgeInsets.only(top: 220.0),
                    child: Column(
                      children: <Widget>[
                        itemCard("Four seater Sofa", "images/chair.jpg", "250", true, "Gray", 0),
                        itemCard("Four seater Sofa", "images/chair.jpg", "250", true, "Red", 1),
                        itemCard("Four seater Sofa", "images/chair.jpg", "250", false, "Red", 2),
                        // itemCard("Four seater Sofa", "images/chair.jpg", "250", true, "Gray", 3),
                        // itemCard("Four seater Sofa", "images/chair.jpg", "250", true, "Gray", 4),
                        // itemCard("Four seater Sofa", "images/chair.jpg", "250", true, "Gray", 5),

                      ],
                    )),
              ]),

            ])
          ])
        ]),

        bottomNavigationBar: Material(
            elevation: 7.0,
            color: Colors.white,
            child: Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                  Text('Total: \$' + totalAmount.toString()),
                SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background
                          onPrimary: Colors.white,
                          elevation: 0.5,
                          textStyle: TextStyle(
                              color: Colors.red
                          )// foreground
                      ),
                      onPressed: () {},
                      // elevation: 0.5,
                      // color: Colors.red,
                      child: Center(
                        child: Text(
                          'Pay Now',
                        ),),))

                  ]),
                )
    )
    ));
  }
  Widget itemCard(itemName, itemImage, itemPrice, itemAvail, itemColor, i)
  {
    return InkWell(
      onTap: (){
        if(itemAvail)
        {
          pickToggle(i);
        }
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Material(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 3.0,
          child: Container(
            padding: EdgeInsets.only(left: 15.0 , right: 10.0),
            width: MediaQuery.of(context).size.width - 20,
            height: 132.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 25.0,
                      width: 25.0,
                      decoration: BoxDecoration(
                          color: itemAvail ?
                          Colors.grey.withOpacity(0.4) : Colors.red.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(12.5)
                      ),
                      child: Center(
                        child: itemAvail ? Container(
                          width: 12.0,
                          height: 12.0,
                          decoration: BoxDecoration(
                              color: picked[i] ? Colors.yellow : Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(6.0)
                          ),
                        ) : Container(),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 5.0,),
                Container(
                  width: 100.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(itemImage),
                          fit: BoxFit.contain
                      )
                  ),
                ),
                SizedBox(width: 4.0),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(itemName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0
                          ),),
                        SizedBox(width: 7.0),

                        itemAvail?   picked[i] ? Text("x1",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          ),)
                            : Container()  : Container()
                      ]   ,
                    ),

                    SizedBox(height: 7.0),

                    itemAvail ? Text("Color: " +itemColor,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Colors.grey
                      ),)  : OutlinedButton(onPressed: (){},
                        child: Center(
                          child: Text("Find Similar",
                            style: TextStyle(
                                color: Colors.red
                            ),),
                        )) ,
                    SizedBox(height: 7.0),

                    itemAvail ? Text(" Rs. $itemPrice",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.yellow.shade700
                      ),)  : Container()
                  ],
                )
              ],
            ),
          ),
        ),
      ),


    );
  }
}
