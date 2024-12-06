import 'package:flutter/material.dart';

class MultiSelectDropdown extends StatefulWidget {
  const MultiSelectDropdown({super.key});

  @override
  _MultiSelectDropdownState createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  List<String> items = ["Apple", "Banana", "Orange", "Grapes", "Pineapple"];
  List<String> selectedItems = [];

  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-Select Dropdown'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Fruits:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  isDropdownOpen = !isDropdownOpen;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: [
                    if (selectedItems.isEmpty)
                      const Text(
                        'Select Items',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )
                    else
                      ...selectedItems.map((item) => Chip(
                            label: Text(item),
                            deleteIcon: const Icon(Icons.close, size: 16),
                            onDeleted: () {
                              setState(() {
                                selectedItems.remove(item);
                              });
                            },
                          )),
                  ],
                ),
              ),
            ),
            if (isDropdownOpen)
              Container(
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: items.map((item) {
                    final isSelected = selectedItems.contains(item);
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedItems.remove(item);
                          } else {
                            selectedItems.add(item);
                          }
                        });
                      },
                      child: Row(
                        children: [
                          Checkbox(
                            value: isSelected,
                            onChanged: (_) {
                              setState(() {
                                if (isSelected) {
                                  selectedItems.remove(item);
                                } else {
                                  selectedItems.add(item);
                                }
                              });
                            },
                          ),
                          Text(item),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
