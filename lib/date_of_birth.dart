import 'package:flutter/material.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({Key? key}) : super(key: key);

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime currentDate = DateTime.now();
  String? selectedDateForBackendDeveloper;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  Future<void> datePicker(BuildContext context) async {
    DateTime? userSelectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2010, 07, 03),
      firstDate: DateTime(1940),
      lastDate: DateTime(2010, 07, 03),
    );

    if (userSelectedDate == null) {
      return;
    } else {
      setState(() {
        currentDate = userSelectedDate;
        selectedDateForBackendDeveloper =
            "${currentDate.year}/${currentDate.month}/${currentDate.day}";
        print("Date $selectedDateForBackendDeveloper");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        title: const Text('Help Us Know You Better'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Additional text below the app bar',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/calendar.png',
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  labelText: "First Name",
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Date Of Birth : ${currentDate.year}/${currentDate.month}/${currentDate.day}",
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  datePicker(context);
                },
                child: const Text('Select A Date'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class DateOfBirth extends StatefulWidget {
//   const DateOfBirth({Key? key}) : super(key: key);

//   @override
//   _DateOfBirthState createState() => _DateOfBirthState();
// }

// class _DateOfBirthState extends State<DateOfBirth> {
//   DateTime? selectedDate;
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();

//   @override
//   void dispose() {
//     firstNameController.dispose();
//     lastNameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Date of Birth'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Welcome!',
//               style: TextStyle(fontSize: 24),
//             ),
//             const SizedBox(height: 20),
//             Image.asset(
//               'assets/calender.gif', // Replace with your GIF file path
//               height: 100,
//               width: 100,
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: TextField(
//                 controller: firstNameController,
//                 decoration: const InputDecoration(
//                   labelText: 'First Name',
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: TextField(
//                 controller: lastNameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Last Name',
//                 ),
//               ),
//             ),
//             if (selectedDate != null) ...[
//               const SizedBox(height: 10),
//               Text(
//                 'Selected Date: ${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
//                 style: const TextStyle(fontSize: 16),
//               ),
//             ],
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 _selectDateOfBirth(context);
//               },
//               child: const Text('Select Date of Birth'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Continue button action
//               },
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(
//                   const Color.fromARGB(255, 77, 77, 77),
//                 ),
//               ),
//               child: const Text('Continue'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _selectDateOfBirth(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );

//     if (pickedDate != null) {
//       setState(() {
//         selectedDate = pickedDate;
//       });
//     }
//   }
// }

