import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opaku/core/constants/constants.dart';
import 'package:opaku/core/repository/analytic/analytics_services.dart';
import 'package:opaku/core/repository/authentication/authentication_services.dart';
import 'package:opaku/logic/app/bloc/app_bloc.dart';
import 'package:opaku/screens/widgets/app_bar.dart';

class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const Profile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Profile",
      ),
      body: SingleChildScrollView(
        padding: kPaddingScrollView,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileHead(),
            ProfileContent()
          ],
        ),
      ),
    );
  }
}

class ProfileHead extends StatelessWidget {
  const ProfileHead({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 100,
          backgroundColor: Theme.of(context).accentColor,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Icon(Icons.person, size: 100, color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          "Hadi Fahriza",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).focusColor
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          "Premium",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: Theme.of(context).focusColor
          ),
        ),
      ],
    );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileItem(
          onTap: () {
            AnalyticsService().sendLogEvent(name: "Edit_Profile", location: "Profile");
          },
          leadingIcon: Icons.person,
          title: "Edit Profile",
          trailingIcon: Icons.keyboard_arrow_right_rounded,
        ),
        SizedBox(height: 10.0),
        ProfileItem(
          onTap: () {
            AnalyticsService().sendLogEvent(name: "Address", location: "Profile");
          },
          leadingIcon: Icons.pin_drop_rounded,
          title: "Address",
          trailingIcon: Icons.keyboard_arrow_right_rounded,
        ),
        SizedBox(height: 10.0),
        ProfileItem(
          onTap: () {
            AnalyticsService().sendLogEvent(name: "Notification", location: "Profile");
          },
          leadingIcon: Icons.notifications_rounded,
          title: "Notification",
          trailingIcon: Icons.keyboard_arrow_right_rounded,
        ),
        SizedBox(height: 10.0),
        ProfileItem(
          onTap: () {
            AnalyticsService().sendLogEvent(name: "Cards", location: "Profile");
          },
          leadingIcon: Icons.credit_card_rounded,
          title: "Cards",
          trailingIcon: Icons.keyboard_arrow_right_rounded,
        ),
        SizedBox(height: 10.0),
        ProfileItem(
          onTap: () {
            AnalyticsService().sendLogEvent(name: "Log_Out", location: "Profile");
            Authentication().logOut();
            context.read<AppBloc>().add(AppLogoutRequested());
          },
          leadingIcon: Icons.logout_rounded,
          title: "Log Out",
          trailingIcon: Icons.keyboard_arrow_right_rounded,
        ),
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.title,
    required this.onTap
  }) : super(key: key);

  final IconData leadingIcon;
  final IconData trailingIcon;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        AnalyticsService().sendLogEvent(name: "Profile item $title", location: "profile");
      },
      leading: Icon(
        leadingIcon,
        size: 26.0,
        color: Theme.of(context).focusColor.withAlpha(95),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).focusColor,
          fontSize: 16.0,
          fontWeight: FontWeight.bold
        ),
      ),
      trailing: Icon(
        trailingIcon,
        size: 26.0,
        color: Theme.of(context).focusColor.withAlpha(95),
      ),
    );
  }
}