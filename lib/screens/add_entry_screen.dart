import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEntry extends StatefulWidget {
  const AddEntry({Key? key}) : super(key: key);

  @override
  State<AddEntry> createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  final _form = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool isLoading = false;
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : SafeArea(
            child: Scaffold(
            appBar: AppBar(
              flexibleSpace: const Center(
                  child: Text(
                'Tell me what happened today',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
            body: Container(
              color: Theme.of(context).colorScheme.background,
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Form(
                    key: _form,
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Form',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 30),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a valid title';
                            } else {
                              return null;
                            }
                          },
                          controller: _titleController,
                          style: const TextStyle(color: Colors.black),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                            labelText: 'Title',
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          maxLines: null,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a valid description';
                            }
                          },
                          controller: _descriptionController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                            labelText: 'Description',
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ))
                      ],
                    )),
              ),
            ),
          ));
  }
}
