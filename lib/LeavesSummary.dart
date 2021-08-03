import 'package:flutter/material.dart';
import 'package:leave_request/components.dart';

class LeavesSummary extends StatefulWidget {
  @override
  _LeavesSummaryState createState() => _LeavesSummaryState();
}

class _LeavesSummaryState extends State<LeavesSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'My Leave Summary',
      ),
    );
  }
}
