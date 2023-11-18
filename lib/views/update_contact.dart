import 'package:contact_app1/controllers/crud_services.dart';
import 'package:flutter/material.dart';

class UpdateContact extends StatefulWidget {
  const UpdateContact(
      {super.key,
      required this.docID,
      required this.name,
      required this.phone,
      required this.email});
  final String docID, name, phone, email;

  @override
  State<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController.text = widget.email;
    phoneController.text = widget.phone;
    nameController.text = widget.name;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Update Contact"),
          leading: const Icon(Icons.update),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? "Name cannot be empty." : null,
                      controller: nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("Name")),
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? "Phone cannot be empty." : null,
                      controller: phoneController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Phone Number")),
                    )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? "Email cannot be empty." : null,
                      controller: emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("Email")),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width * .9,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            CRUDService().updateContact(
                              nameController.text,
                              phoneController.text,
                              emailController.text,
                              widget.docID,
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ))),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width * .9,
                    child: OutlinedButton(
                        onPressed: () {
                          CRUDService().deleteContact(widget.docID);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Delete",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ))),
              ]),
            ),
          ),
        ));
  }
}
