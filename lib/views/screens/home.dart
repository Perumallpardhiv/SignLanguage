import 'package:flutter/material.dart';
import 'package:signlang/routes/route_constants.dart';
import 'package:signlang/views/widgets/options_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            const Center(
              child: Text(
                "Select Required Option...",
                style: TextStyle(
                  fontSize: 27.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                OptionWidget(
                  title: 'Upload',
                  description:
                      "Upload image and get respective text and also convert it to speech",
                  icon: Icons.file_upload_rounded,
                  onTap: () =>
                      Navigator.pushNamed(context, RouteConstants.upload),
                ),
                SizedBox(height: 10),
                OptionWidget(
                  title: 'Translate',
                  description: "Translate text to sign language",
                  icon: Icons.translate_rounded,
                  onTap: () =>
                      Navigator.pushNamed(context, RouteConstants.translate),
                ),
                SizedBox(height: 10),
                OptionWidget(
                  title: 'RealTime',
                  description: "Converts Sign to Text On the Spot",
                  icon: Icons.read_more_outlined,
                  onTap: () =>
                      Navigator.pushNamed(context, RouteConstants.realtime),
                ),
                SizedBox(height: 10),
                OptionWidget(
                  title: 'Sign Language',
                  description: "Learn sign language",
                  icon: Icons.follow_the_signs_rounded,
                  onTap: () =>
                      Navigator.pushNamed(context, RouteConstants.learnsigns),
                ),
                SizedBox(height: 10),
                OptionWidget(
                    title: 'Special Signs',
                    description: "Learn special signs",
                    icon: Icons.import_contacts_rounded,
                    onTap: () => Navigator.pushNamed(
                        context, RouteConstants.specialsigns)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
