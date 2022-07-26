import 'package:flutter/material.dart' hide Colors;
import 'package:zinotalens/widgets/custom_appbar.dart';

import '../utils/colors.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.backgroundColor,
      appBar: customAppBar(context, title: "Notification", isCartIcon: false),
    );
  }
}
