import 'package:firebase_signin/api/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../reusable_widget/reusable_widget.dart';
import '../utils/color_utils.dart';

class updateUserForm extends StatefulWidget {
  // final MyHomePage show_details;

  // const updateUserForm(this.show_details, {Key? key, required String title})
  //     : super(key: key);

  @override
  State<updateUserForm> createState() => _updateUserFormState();
}

class _updateUserFormState extends State<updateUserForm> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  TextEditingController _dateController = new TextEditingController();

  // @override
  // void initState() {
  //   _titleController.text = widget.show_details.title;
  //   _descriptionController.text = widget.show_details.description;
  //   _dateController.text = widget.show_details.date;
  // }

  @override
  Widget build(BuildContext context) {
    // var barColor2 = Color(0xff4568dc);
    // var barColor2 = Color(0xff5b86e5);
    // var barColor2 = Color(0xff667eea);
    final style = TextStyle(fontSize: 25);
    // final style = TextStyle(fontSize: 45, fontWeight: FontWeight.bold);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // backgroundColor: barColor2,
        title: Column(
          children: [
            Text(
              'Update Todo List',
              // style: GoogleFonts.tangerine(textStyle: style),
              style: GoogleFonts.pacifico(textStyle: style),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              hexStringToColor("5E61F4"),
              hexStringToColor("9546C4"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
              hexStringToColor("9546C4"),
              // hexStringToColor("CB2B93"),
              // hexStringToColor("9546C4"),
              // hexStringToColor("5E61F4")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100.0,
              ),
              reusableTextField(
                  "Title", Icons.title_outlined, false, _titleController),
              const SizedBox(
                height: 20.0,
              ),
              reusableTextField("Description", Icons.description_outlined,
                  false, _descriptionController),
              const SizedBox(
                height: 20.0,
              ),
              reusableTextField(
                  "Date", Icons.date_range_outlined, false, _dateController),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // MainAxisAlignment = MainAxisAlignment.spaceBetween,
                  TextButton(
                      onPressed: () {
                        print('Update Detailss');
                      },
                      child: OutlinedButton(
                        onPressed: () {
                          print('Update Details');
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0))),
                        ),
                        child: const Text(
                          "Update",
                          style:
                              TextStyle(fontSize: 18, color: Colors.cyanAccent),
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        print('Clear Button');
                      },
                      child: OutlinedButton(
                        onPressed: () {
                          print('Clear Details');
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0))),
                        ),
                        child: const Text(
                          "  Clear  ",
                          style:
                              TextStyle(fontSize: 18, color: Colors.cyanAccent),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
