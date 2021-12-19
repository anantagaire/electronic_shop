import 'package:electronic_shop/core/services/login_services.dart';
import 'package:electronic_shop/ui/pages/home_page/home_page.dart';
import 'package:electronic_shop/ui/pages/splash_screen/splash_screen.dart';
import 'package:electronic_shop/ui/styles/colors.dart';
import 'package:electronic_shop/ui/widgets/error_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.3,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Hey, Welcome. Are you ready to sign in?',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              height: height * 0.16,
            ),
            Container(
              height: height*0.08,
              width: width*0.9,
              child: OutlineButton.icon(
                onPressed: () async{
                  var provider = Provider.of<LoginServices>(context, listen: false);
                  final isLoading = await provider.googleSignInTo();

                  if(isLoading)
                    {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>HomePage()));
                    }
                  else{
                    showDialog(
                        context: context,
                        builder: (context) {
                          return errorWidgets(context, "Error", "Please try again");
                        });
                  }


                },
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: AppColors.textColor,
                  size: 22,
                ),
                shape: StadiumBorder(),
                highlightedBorderColor: Colors.white,
                borderSide: BorderSide(
                  width: 2.4,
                  color: Colors.white
                ),
                label: Text(
                  'SignIn with Google',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
