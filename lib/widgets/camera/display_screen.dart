import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  final List<String> names;
  final List<String> companyNames;
  final List<String> jobPositions;
  final List<String> emails;
  final List<String> phoneNumbers;
  final List<String> urls;
  final List<String> locations;

  const DisplayScreen({super.key, 
    this.names = const [],
    this.companyNames = const [],
    this.jobPositions = const [],
    this.emails = const [],
    this.phoneNumbers = const [],
    this.urls = const [],
    this.locations = const [],
  });

  @override
  State<DisplayScreen>createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  bool editMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(31, 34, 31, 31),
        title: const Text("Extracted Entities"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            EntityListCard(
              label: "Names",
              data: widget.names,
              editMode: editMode,
              onLabelChanged: (value) {
                // Handle label change here
              },
            ),
            EntityListCard(
              label: "Company Names",
              data: widget.companyNames,
              editMode: editMode,
              onLabelChanged: (value) {
                // Handle label change here
              },
            ),
            EntityListCard(
              label: "Job Positions",
              data: widget.jobPositions,
              editMode: editMode,
              onLabelChanged: (value) {
                // Handle label change here
              },
            ),
            EntityListCard(
              label: "Emails",
              data: widget.emails,
              editMode: editMode,
              onLabelChanged: (value) {
                // Handle label change here
              },
            ),
            EntityListCard(
              label: "Phone Numbers",
              data: widget.phoneNumbers,
              editMode: editMode,
              onLabelChanged: (value) {
                // Handle label change here
              },
            ),
            EntityListCard(
              label: "URLs",
              data: widget.urls,
              editMode: editMode,
              onLabelChanged: (value) {
                // Handle label change here
              },
            ),
            EntityListCard(
              label: "Locations",
              data: widget.locations,
              editMode: editMode,
              onLabelChanged: (value) {
                // Handle label change here
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            editMode = !editMode;
          });

          // If in edit mode, you can save the data
          if (editMode) {
            // Add your save functionality here
            // For example, you can save the extracted entities to a file or database
            // You can also show a confirmation dialog upon successful save
            // Here's a simple example to show a snackbar message:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Entities saved successfully!"),
              ),
            );
          }
        },
        backgroundColor: Colors.black,
        child: editMode ? const Icon(Icons.save) : const Icon(Icons.edit),
      ),
    );
  }
}

class EntityListCard extends StatelessWidget {
  final String label;
  final List<String> data;
  final bool editMode;
  final ValueChanged<String> onLabelChanged;

  const EntityListCard({super.key, 
    required this.label,
    required this.data,
    required this.editMode,
    required this.onLabelChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: editMode
                      ? TextFormField(
                          initialValue: label,
                          onChanged: onLabelChanged,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          label,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: editMode
                    ? TextFormField(
                        initialValue: data[index],
                        onChanged: (value) {
                          // Handle data change
                        },
                      )
                    : Text(data[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
