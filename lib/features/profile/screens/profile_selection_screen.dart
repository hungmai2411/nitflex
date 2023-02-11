import 'package:flutter/material.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/asset_helpers.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/features/profile/widgets/item_box.dart';
import 'package:niflex/features/profile/widgets/profile_icon.dart';
import 'package:niflex/features/profile/widgets/success_dialog.dart';
import 'package:niflex/main_app.dart';
import 'package:niflex/providers/notification_provider.dart';
import 'package:provider/provider.dart';

class ProfileSelectionScreen extends StatefulWidget {
  const ProfileSelectionScreen({super.key});
  static const String routeName = '/profile_selection';

  @override
  State<ProfileSelectionScreen> createState() => _ProfileSelectionScreenState();
}

class _ProfileSelectionScreenState extends State<ProfileSelectionScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      ColorPalette.textColor = Colors.white;
      ColorPalette.backgroundScaffoldColor = const Color(0xFF171A20);

      print('dark');
    } else {
      ColorPalette.textColor = const Color(0xFF212121);
      ColorPalette.backgroundScaffoldColor = Colors.white;

      print('white');
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetHelper.movaLogo,
          height: 52.0,
          fit: BoxFit.fitHeight,
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Check In',
            style: TextStyles.defaultStyle.medium
                .setTextSize(18)
                .setColor(ColorPalette.textColor),
          ),
          GridView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.0,
                mainAxisSpacing: 32.0,
                crossAxisSpacing: 8.0,
                crossAxisCount: 2,
              ),
              itemCount: 8,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: () async {
                    //Navigator.pushNamed(context, MainApp.routeName);
                  },
                  child: ItemBox(
                    isPicked: index == selectedIndex ? true : false,
                    index: index,
                    callback: (p0) async {
                      setState(() {
                        selectedIndex = p0;
                      });
                      context.read<NotificationProvider>().addVoucher('OKOKOK');

                      await showDialog(
                        context: context,
                        builder: (_) {
                          return const AppDialog(
                            child: BuySuccessDialog(),
                          );
                        },
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class Smile extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = size / 2;
    var paint = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(size.width * .20, center.height * .50),
        size.shortestSide * .05, paint);

    canvas.drawCircle(Offset(size.width * .80, center.height * .50),
        size.shortestSide * .05, paint);

    var startPoint = Offset(size.width * .25, size.height / 2);
    var controlPoint1 = Offset(size.width * .3, size.height / 1.6);
    var controlPoint2 = Offset(size.width * .6, size.height / 1.6);
    var endPoint = Offset(size.width * .8, size.height / 2);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);

    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    path.cubicTo(size.width * .8, size.height / 2, size.width * .86,
        size.height / 2, size.width * .8, size.height / 1.8);

    path.cubicTo(size.width * .6, size.height / 1.4, size.width * .3,
        size.height / 1.46, size.width * .25, size.height / 1.7);

    path.cubicTo(size.width * .25, size.height / 1.68, size.width * .18,
        size.height / 2, size.width * .25, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(Smile oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(Smile oldDelegate) => false;
}
