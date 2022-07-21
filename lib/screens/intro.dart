import 'package:deus_vult/utils/deus_vult.dart';
import 'package:flutter/material.dart';
import 'package:deus_vult/utils/my_navigator.dart';
import 'package:deus_vult/widgets/walkthrough.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEEEEE),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: <Widget>[
                Walkthrough(
                  title: Deus_Vult.wt1,
                  content: Deus_Vult.wc1,
                  imageIcon: Icons.check_rounded,
                ),
                Walkthrough(
                  title: Deus_Vult.wt2,
                  content: Deus_Vult.wc2,
                  imageIcon: Icons.dashboard_rounded,
                ),
                Walkthrough(
                  title: Deus_Vult.wt3,
                  content: Deus_Vult.wc3,
                  imageIcon: Icons.upload_rounded,
                ),
                Walkthrough(
                  title: Deus_Vult.wt4,
                  content: Deus_Vult.wc4,
                  imageIcon: Icons.qr_code_scanner_rounded,
                ),
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(lastPage ? "" : Deus_Vult.skip,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () =>
                      lastPage ? null : MyNavigator.goToLogin(context),
                ),
                FlatButton(
                  child: Text(lastPage ? Deus_Vult.gotIt : Deus_Vult.next,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? MyNavigator.goToLogin(context)
                      : controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
