import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/widgets/profile_option_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withOpacity(.5),
                  ),
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * .4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(
                        height: 24.0,
                        child: Image.asset("assets/images/verified.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'johndoe@gmail.com',
                style: TextStyle(
                  color: Constants.blackColor.withOpacity(.3),
                ),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                height: size.height * .7,
                width: size.width,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileOptionWidget(
                        title: 'My Profile', icon: Icons.person),
                    ProfileOptionWidget(
                        title: 'Settings', icon: Icons.settings),
                    ProfileOptionWidget(title: 'Faqs', icon: Icons.chat),
                    ProfileOptionWidget(title: 'Share', icon: Icons.share),
                    ProfileOptionWidget(title: 'Logout', icon: Icons.logout),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
