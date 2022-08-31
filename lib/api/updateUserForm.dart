import 'package:firebase_signin/api/todo_list.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Todo Details'),
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
                height: 20.0,
              ),
              reusableTextField(
                  "Enter Title", Icons.title_outlined, false, _titleController),
              const SizedBox(
                height: 20.0,
              ),
              reusableTextField("Enter Description", Icons.description_outlined,
                  false, _descriptionController),
              const SizedBox(
                height: 20.0,
              ),
              reusableTextField("Select Date", Icons.date_range_outlined, false,
                  _dateController),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
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
                          style: TextStyle(
                              fontSize: 18, color: Colors.yellowAccent),
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
                          "Clear",
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
