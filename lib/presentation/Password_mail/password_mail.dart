import 'package:flutter/material.dart';
import 'package:DressMeDaily/core/app_export.dart';

class Password_mail extends StatelessWidget {
  const Password_mail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            SizedBox(height: 40.v),
            Container(
              height: 6.v,
              width: double.maxFinite,
              decoration: BoxDecoration(color: appTheme.black900),
              child: LinearProgressIndicator(
                backgroundColor: appTheme.black900,
                valueColor: AlwaysStoppedAnimation<Color>(appTheme.lime400),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Spacer(flex: 39),
                  Container(
                    width: 260.h,
                    margin: EdgeInsets.symmetric(horizontal: 50.h),
                    child: Text(
                      "You will receive a password change link to your mail",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  const Spacer(flex: 60),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        onTapTxtNext(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 50.h),
                        child: Text(
                          "Next",
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 10),
                ],
              ),
            ),
          ],
        ),

    );
  }


  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset('assets/images/Line arrow-left.png'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),

    );
  }



  /// Navigates to the frame287Screen when the action is triggered.
  onTapTxtNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.starting_page_signup);
  }
}
