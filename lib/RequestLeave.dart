import 'package:flutter/material.dart';
import 'package:leave_request/components.dart';

class RequestLeave extends StatefulWidget {
  @override
  _RequestLeaveState createState() => _RequestLeaveState();
}

class _RequestLeaveState extends State<RequestLeave> {
  final formKey = GlobalKey<FormState>();
  String error = '';
  final TextEditingController numberOfDays = new TextEditingController();
  final TextEditingController startDate = new TextEditingController();
  final TextEditingController endDate = new TextEditingController();
  final TextEditingController reportBackDate = new TextEditingController();
  final TextEditingController dutyDelegatee = new TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime startHolder = DateTime.now();
  DateTime endHolder = DateTime.now();

  int daysDifference;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    numberOfDays.dispose();
    startDate.dispose();
    endDate.dispose();
    reportBackDate.dispose();
    dutyDelegatee.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context,
      TextEditingController controller) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2018, 8),
        lastDate: DateTime(2101),
        builder: (BuildContext context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Theme
                      .of(context)
                      .primaryColor, //top bit bg
                  onPrimary: Colors.white, //top bit fonts
                  onSurface: Theme
                      .of(context)
                      .backgroundColor, //dates color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary:
                    Theme
                        .of(context)
                        .backgroundColor, // button text color
                  ),
                ),
                dialogBackgroundColor:
                Theme
                    .of(context)
                    .scaffoldBackgroundColor,
              ),
              child: child);
        });
    if (picked != null)
      setState(() {
        controller.value = TextEditingValue(
          text: picked.day.toString().padLeft(2, "0") +
              '/' +
              picked.month.toString().padLeft(2, "0") +
              '/' +
              picked.year.toString(),
        );

        if (controller == startDate) {
          setState(() {
            startHolder = picked;
          });
        }
        if (controller == endDate) {
          setState(() {
            endHolder = picked;
          });
        }
      });
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to
        .difference(from)
        .inHours / 24).round();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      numberOfDays.value = TextEditingValue(
          text: daysBetween(startHolder, endHolder).toString());
    });

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: Text(
      //     'Request Leave',
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      //   leading: AppBarIcon(
      //     icon: Icons.arrow_back,
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //   ),
      // ),
      appBar: MyAppBar(
        title: 'Request Leave',
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Fill in Leave Details :",
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1,
                  ),
                ),
                leaveDetailsSection(context),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SubmitButton(
                    label: "Request Leave",
                    color: Theme
                        .of(context)
                        .primaryColor,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget leaveDetailsSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Theme.of(context).backgroundColor),
      // ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _pickDate(context, startDate),
              child: AbsorbPointer(
                child: EntryField(
                  title: 'Leave Start Date',
                  err: 'Enter StartDate',
                  type: TextInputType.text,
                  controller: startDate,
                  isPassword: false,
                  icon: Icons.calendar_today_outlined,
                  borderColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () => _pickDate(context, endDate),
              child: AbsorbPointer(
                child: EntryField(
                  title: 'Leave End Date',
                  err: 'Enter end date',
                  // validator: (val) => {
                  //   endDate.value
                  //           .toString()
                  //           .compareTo(startDate.value.toString()) >
                  //       0
                  // },
                  type: TextInputType.text,
                  controller: endDate,
                  isPassword: false,
                  icon: Icons.calendar_today_outlined,
                  borderColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            EntryField(
              title: 'Number of days applied for',
              err: 'Enter Number of days',
              enabled: false,
              type: TextInputType.number,
              controller: numberOfDays,
              isPassword: false,
              icon: Icons.format_list_numbered,
              borderColor: Colors.transparent,
            ),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () => _pickDate(context, reportBackDate),
              child: AbsorbPointer(
                child: EntryField(
                  title: 'Report Back Date',
                  err: 'Enter report back date',
                  type: TextInputType.text,
                  controller: reportBackDate,
                  isPassword: false,
                  icon: Icons.calendar_today,
                  borderColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            EntryField(
              title: 'Duties Delegated To',
              err: 'Enter delegatee',
              type: TextInputType.phone,
              controller: dutyDelegatee,
              isPassword: false,
              icon: Icons.perm_identity,
              borderColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
