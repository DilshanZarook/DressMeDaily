import 'package:flutter/material.dart';
import 'package:DressMeDaily/core/app_export.dart';
import 'package:DressMeDaily/presentation/Loading_page_2/loading_page_2.dart';
// Adjust the path as necessary

class Instructions_page extends StatelessWidget {
  const Instructions_page({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 20.v),
            child: Column(
              children: [
                _buildFrameLineFive(context),
                SizedBox(height: 30.v),
                Text(
                  "Instructions",
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(height: 500.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 50.h),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Loading_page_2()),
                        );
                      },
                      child: Text(
                        "Next",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }


  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset('assets/images/Line arrow-left.png'), // Replace with your actual arrow image asset path
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildFrameLineFive(BuildContext context) {
    return SizedBox(
      height: 24.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 9.v),
              child: const SizedBox(
                width: double.maxFinite,
                child: Divider(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 6.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.lime,
                borderRadius: BorderRadius.circular(
                  0.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
