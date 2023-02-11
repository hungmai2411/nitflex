import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/features/profile/screens/subcribe_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        CircleAvatar(
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1675789652617-d84e3d201ef4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMnx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
          ),
          radius: 60,
        ),
        const SizedBox(height: 10),
        Text(
          'Tommy Hung',
          style: TextStyles.defaultStyle.bold
              .setColor(Colors.white)
              .setTextSize(18),
          textAlign: TextAlign.center,
        ),
        Text(
          'maiphamquochung@gmail.com',
          style: TextStyles.defaultStyle.medium
              .setColor(Colors.white)
              .setTextSize(16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SubcribeScreen.routeName);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorPalette.primaryColor,
              ),
              borderRadius: BorderRadius.circular(13),
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.crown,
                  color: ColorPalette.primaryColor,
                  size: 40,
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Join Preminum!',
                      style: TextStyles.defaultStyle.bold
                          .setColor(ColorPalette.primaryColor)
                          .setTextSize(19),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Enjoy watching Full-HD Movies',
                      style: TextStyles.defaultStyle.medium
                          .setColor(Colors.white)
                          .setTextSize(16),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        const itemStat(
          stat: 'Edit Profile',
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        const itemStat(
          stat: 'Notification',
          icon: Icon(
            FontAwesomeIcons.bell,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        const itemStat(
          stat: 'Download',
          icon: Icon(
            FontAwesomeIcons.download,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        const itemStat(
          stat: 'Security',
          icon: Icon(
            Icons.security,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        const itemStat(
          stat: 'Language',
          icon: Icon(
            Icons.language_rounded,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        const itemStat(
          stat: 'Dark Mode',
          icon: Icon(
            FontAwesomeIcons.eye,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        const itemStat(
          stat: 'Help Center',
          icon: Icon(
            FontAwesomeIcons.info,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        const itemStat(
          stat: 'Privacy Policy',
          icon: Icon(
            FontAwesomeIcons.lock,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class itemStat extends StatelessWidget {
  final String stat;
  final Icon icon;
  const itemStat({
    required this.stat,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 15),
          Text(
            stat,
            style: TextStyles.defaultStyle.medium
                .setColor(Colors.white)
                .setTextSize(16),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
