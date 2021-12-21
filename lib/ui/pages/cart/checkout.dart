import 'package:electronic_shop/core/services/validation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {

  String? name, billingAddress, deliveryAddress, phoneNumber, date;
  GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Validation>(context, listen: false);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Consumer<Validation>(
        builder: (context,state,index){
          return Form(
            key: _key,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    onChanged: (value){
                      provider.checkNameValid(value);
                    },
                    onSaved: (val) => this.name = val,
                    validator: (val) {
                      if (state.isNameValid==null || !state.isNameValid!) {
                        return 'Name is Empty';
                      } else {
                        return null;
                      }
                    },
                    style: Theme.of(context).textTheme.caption,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                        ),
                        labelText: 'Name',
                        labelStyle: Theme.of(context).textTheme.caption),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    onChanged: (val)=>provider.checkBillingAddressValid(val),
                    onSaved: (val) => this.billingAddress = val,
                    validator: (val) {
                      if (state.isBillingAddressValid==null || !state.isBillingAddressValid!) {
                        return 'Billing Address is Empty';
                      } else {
                        return null;

                      }
                    },
                    style: Theme.of(context).textTheme.caption,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Billing Address',
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                        ),
                        labelText: 'Billing Address',
                        labelStyle: Theme.of(context).textTheme.caption),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    onChanged: (val)=>provider.checkDeliveryAddressValid(val),

                    onSaved: (val) => this.deliveryAddress = val,
                    validator: (val) {

                      if (state.isDeliveryAddressValid==null || !state.isDeliveryAddressValid!) {
                        return 'Delivery Address is Empty';
                      } else {
                        return null;
                      }
                    },
                    style: Theme.of(context).textTheme.caption,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Delivery Address',
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                        ),
                        labelText: 'Delivery Address',
                        labelStyle: Theme.of(context).textTheme.caption),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    onChanged: (val)=>provider.checkPhoneValid(val),
                    onSaved: (val) => this.phoneNumber = val,
                    validator: (val) {

                      if (state.isPhoneValid==null||!state.isPhoneValid!) {
                        return 'Invalid Phone';
                      } else {
                        return null;
                      }

                    },
                    style: Theme.of(context).textTheme.caption,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        border: OutlineInputBorder(),
                        hintText: 'Enter your Phone',
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                        ),
                        labelText: 'Phone',
                        labelStyle: Theme.of(context).textTheme.caption),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
                  child: Text(
                    DateTime.now().toString().substring(0, 10),
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left:10, right:10, top: 20),
                  child: InkWell(
                    onTap: () {


                      if(_key.currentState!.validate())
                      {
                        _key.currentState!.save();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Submitted'),
                        ));


                      }



                    },
                    child: Ink(
                      height: 40,
                      width: double.infinity,
                      color: Colors.red,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Checkout Now',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
