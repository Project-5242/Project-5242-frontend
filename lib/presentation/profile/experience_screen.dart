// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../AppProvider/app_provider.dart';

// class ExperienceScreen extends StatefulWidget {
//   const ExperienceScreen({Key? key}) : super(key: key);

//   @override
//   _ExperienceScreenState createState() => _ExperienceScreenState();
// }

// class _ExperienceScreenState extends State<ExperienceScreen> {
//   final List<Map<String, dynamic>> _experiences = [];
//   bool _isFirstTimeUser = true;

//   @override
//   void initState() {
//     super.initState();
//     // Check if user is first time
//     final appProvider = Provider.of<AppProvider>(context, listen: false);
//     _isFirstTimeUser = appProvider.isNewUser;
    
//     // Load existing experiences if not first time
//     if (!_isFirstTimeUser) {
//       _loadExperiences();
//     }
//   }

//   void _loadExperiences() {
//     // TODO: Load experiences from API or local storage
//     setState(() {
//       _experiences.addAll([
//         {'id': 1, 'title': 'Experience 1', 'description': 'Description 1'},
//         {'id': 2, 'title': 'Experience 2', 'description': 'Description 2'},
//       ]);
//     });
//   }

//   void _addNewExperience() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => _ExperienceForm(
//           onSave: (experience) {
//             setState(() {
//               _experiences.add(experience);
//               _isFirstTimeUser = false;
//             });
//           },
//         ),
//       ),
//     );
//   }

//   void _editExperience(Map<String, dynamic> experience) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => _ExperienceForm(
//           experience: experience,
//           onSave: (updatedExperience) {
//             setState(() {
//               final index = _experiences.indexWhere(
//                   (exp) => exp['id'] == updatedExperience['id']);
//               if (index != -1) {
//                 _experiences[index] = updatedExperience;
//               }
//             });
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_isFirstTimeUser
//             ? AppStrings.createProfile
//             : AppStrings.editUpdate),
//       ),
//       body: _isFirstTimeUser
//           ? _buildFirstTimeUserView()
//           : _buildExperienceListView(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addNewExperience,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   Widget _buildFirstTimeUserView() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             AppStrings.readyCreateProfile1,
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.headline5,
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _addNewExperience,
//             child: Text(AppStrings.createProfile),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildExperienceListView() {
//     return ListView.builder(
//       itemCount: _experiences.length,
//       itemBuilder: (context, index) {
//         final experience = _experiences[index];
//         return ListTile(
//           title: Text(experience['title']),
//           subtitle: Text(experience['description']),
//           trailing: IconButton(
//             icon: const Icon(Icons.edit),
//             onPressed: () => _editExperience(experience),
//           ),
//         );
//       },
//     );
//   }
// }

// class _ExperienceForm extends StatefulWidget {
//   final Map<String, dynamic>? experience;
//   final Function(Map<String, dynamic>) onSave;

//   const _ExperienceForm({
//     Key? key,
//     this.experience,
//     required this.onSave,
//   }) : super(key: key);

//   @override
//   __ExperienceFormState createState() => __ExperienceFormState();
// }

// class __ExperienceFormState extends State<_ExperienceForm> {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController _titleController;
//   late TextEditingController _descriptionController;

//   @override
//   void initState() {
//     super.initState();
//     _titleController = TextEditingController(
//         text: widget.experience?['title'] ?? '');
//     _descriptionController = TextEditingController(
//         text: widget.experience?['description'] ?? '');
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.experience == null
//             ? AppStrings.addEntry
//             : AppStrings.editUpdate),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _titleController,
//                 decoration: InputDecoration(
//                   labelText: AppStrings.title,
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a title';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(
//                   labelText: AppStrings.addDescription,
//                 ),
//                 maxLines: 3,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a description';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _saveExperience,
//                 child: Text(AppStrings.save),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _saveExperience() {
//     if (_formKey.currentState!.validate()) {
//       final experience = {
//         'id': widget.experience?['id'] ?? DateTime.now().millisecondsSinceEpoch,
//         'title': _titleController.text,
//         'description': _descriptionController.text,
//       };
//       widget.onSave(experience);
//       Navigator.pop(context);
//     }
//   }
// }