import 'package:electronic_shop/core/models/category_models.dart';
import 'package:electronic_shop/core/services/category_services.dart';
import 'package:electronic_shop/core/services/product_services.dart';
import 'package:electronic_shop/ui/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  CategoryServices categoryServices = CategoryServices();
  List<CategoryModels> category = [];
  int _value1  = 0, _value2 = 0;
  List<String> words = [];

  @override
  void initState() {
    category = categoryServices.addList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 10,),
            Center(
              child: Text(
                'Filters',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline2,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Price',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
            ),

            _price("From low to high", 0),
            _price("From high to low", 1),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Category',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
            ),
            SizedBox(height: 10,),
            GridView.builder(
                shrinkWrap: true,
                itemCount: category.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: width * 0.2 / 20
                ), itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(category[index].name!, style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1),
                    Checkbox(
                        value: category[index].value, onChanged: (value) {
                      setState(() {
                        category[index].value = value;
                        if(category[index].value!)
                          {
                            if(!words.contains(category[index].name))
                              {
                                words.add(category[index].name!);
                              }
                          }
                      });
                    })
                  ],
                ),
              );
            }),

            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Date',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
            ),
            SizedBox(height: 10,),

            _container('Ascending', 0),
            _container('Descending', 1),

            Container(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20, ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      color: Colors.white,
                      height: 40,
                      alignment: Alignment.center,
                      width: width*0.4,
                      child: Text('Cancel', style: Theme.of(context).textTheme.caption,),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  GestureDetector(
                    onTap: (){
                      Provider.of<ProductServices>(context, listen: false).getProductList(_value1,0,words);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>HomePage()));
                    },
                    child: Container(
                      color: Colors.red,
                      height: 40,
                      alignment: Alignment.center,
                      width: width*0.4,
                      child: Text('Apply', style: Theme.of(context).textTheme.caption,),
                    ),
                  ),
                ],
              ),
            )



          ],
        ),
      ),
    );
  }

  Widget _price(String text, int value) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme
              .of(context)
              .textTheme
              .bodyText1,),
          Radio(
            value: value,
            onChanged: (int? value) {
              setState(() {
                this._value1= value!;
              });
            },
            groupValue: _value1,
          )
        ],
      ),
    );
  }

  Widget _container(String text, int value) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme
              .of(context)
              .textTheme
              .bodyText1,),
          Radio(
            value: value,
            onChanged: (int? value) {
              setState(() {
                this._value2= value!;
              });
            },
            groupValue: _value2,
          )
        ],
      ),
    );
  }

}
