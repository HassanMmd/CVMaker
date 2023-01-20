import 'package:cvmaker/model/contactInfo.dart';
import 'package:cvmaker/viewmodel/contactInfoViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



List<String> typeList = ['EMAIL','PHONE','LINKED_IN','GITHUB','WEBSITE','PORTFOLIO','LINK'];

class AddContactInfo extends StatefulWidget {
  const AddContactInfo({Key? key}) : super(key: key);

  @override
  State<AddContactInfo> createState() => _AddContactInfoState();
}

class _AddContactInfoState extends State<AddContactInfo> {

  String? data;
  String? type;

  String dropdownValue = typeList.first;

  @override
  Widget build(BuildContext context) {
    var contact = context.watch<ContactInfoViewModel>();


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Information',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.green,
                ),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
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
                    data = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Add your $dropdownValue*',
                    hintStyle: const TextStyle(color: Color(0XFFC3BCBC)),
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
                        if (data == null) {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 200.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Please fill all the fields',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 25.0),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Ok'))
                                    ],
                                  ),
                                );
                              });
                        } else {
                          type=dropdownValue;
                          print(type);
                          await contact
                              .addContactInfo(ContactInfo(data!, type!));
                          print(type);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Add')),
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
