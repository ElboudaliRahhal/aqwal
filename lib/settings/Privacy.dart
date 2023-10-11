import 'package:aqwal/NavBar.dart';
import 'package:flutter/material.dart';




class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Privacy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
        child: Text(
    "Privacy policy Our Privacy Policy explains : What information do we collect and why do we collect it?How we use this information.The information we collectWe collect information to better serve all of our users. Information we get about you from other services such as Google Analytics, Firebase, Google admob , Google Play, and other services we use to improve our applications and services.If you choose to use our service, you agree to collect and use information about this policy. The personal information we collect is used to provide and improve the service. We will not use or share your information with anyone except as described in this Privacy Policy.This information includes: information you provide us - for example, if we request a login or registration request to store or synchronize your date - we will ask you for personal information, such as your name, email address, photos, location or phone number. Or you'll be asked to sign in to your Google Account (perhaps Facebook or other accounts). The information we request will be retained on your device and will not be collected in any way by us and will be used as described in this privacy policy. We do not collect any personal information in our children's applications. In our children's applications, users can access the app or game in their entity without any signature.Device information - Device-specific information such as device model, operating system version, unique device identifiers, and mobile network information.Log information - This may include: details of how you use the applications or services we provide; IP address information about device events, such as crashes, system activity, device settings, browser type, browser language, date and time of your request and referral URL; cookies that may identify your browser or account Uniquely.Location information - Some of the services we use in applications (e.g. Google Analytics) may collect and process information about your site. All data relating to your site and non-personal information is collected.Unique application numbers - Some services include a unique application number. This number and information about the installation (for example, operating system type and application version number)Local storage - We may collect and store information (including personal information) locally on your device using mechanisms such as web browser storage (including HTML 5) and storage of application data memory. Our apps may allow images to be downloaded and set as wallpaper"
    ),
    )
        )
      )
    );
  }
}
