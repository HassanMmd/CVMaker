import 'package:cvmaker/model/contactInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/contactInfoViewModel.dart';

List<String> typeList = [
  'EMAIL',
  'PHONE',
  'LINKED_IN',
  'GITHUB',
  'WEBSITE',
  'PORTFOLIO',
  'LINK'
];

class EditContactInfo extends StatefulWidget {
  ContactInfo? contactInfo;

  EditContactInfo(this.contactInfo, {Key? key}) : super(key: key);

  @override
  State<EditContactInfo> createState() => _EditContactInfoState();
}

class _EditContactInfoState extends State<EditContactInfo> {
  String? data;
  String? type;

  String dropdownValue = typeList.first;

  @override
  Widget build(BuildContext context) {
    var contact = context.watch<ContactInfoViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Contact Information',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DropdownButton<String>(
                  value: widget.contactInfo?.type,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.green,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      widget.contactInfo?.type = value!;
                    });
                  },
                  items: typeList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 50,
                width: 350,
                child: TextField(
                  // textAlign: TextAlign.center,
                  onChanged: (value) {
                    widget.contactInfo?.data = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Add your $dropdownValue*',
                    hintStyle: const TextStyle(color: Color(0XFFC3BCBC)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0XFF568ABB),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0XFF568ABB),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30.0,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0XFF568ABB)),
                      ),
                      onPressed: () async {
                        // dropdownValue = widget.contactInfo!.type;
                        // type = dropdownValue;
                        // data = widget.contactInfo!.data;
                        print(type);
                        await contact.editInfo(widget.contactInfo!);
                        Navigator.pop(context);
                      },
                      child: const Text('Save')),
                  const SizedBox(
                    width: 200.0,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0XFFF22C2C)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
