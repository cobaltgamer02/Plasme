import 'package:flutter/material.dart';
import 'package:plasma_donor/screens/searchdonors.dart';
import 'DB/post.dart';
import 'DB/postservice.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<FormState> formkey = new GlobalKey();
  late Post post;
  String _currentBloodGroupSelected = 'A+';
  String _currentGenderGroupSelected = 'Male';
  final List<String> _bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  final List<String> _genderGroup = ['Male', 'Female', 'Trans'];

  @override
  void initState() {
    post = Post(
      '',
      '',
      0,
      '',
      '',
      '',
      '',
      0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('REGISTRATION'),
        backgroundColor: Colors.red,
      ),
      body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onSaved: (val) => post.first_name = val!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'title field cannot be empty';
                      } else if (value.length > 16) {
                        return 'title cannot be greater than 16 characters';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onSaved: (val) => post.last_name = val!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'title field cannot be empty';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Age',
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onSaved: (val) => post.age = val!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'title field cannot be empty';
                      } else if (value.length > 16) {
                        return 'title cannot be greater than 16 characters';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton(
                      items: _bloodGroups
                          .map(
                            (String dropdownMenuStringItem) => DropdownMenuItem(
                              child: Text(dropdownMenuStringItem),
                              value: dropdownMenuStringItem,
                            ),
                          )
                          .toList(),
                      hint: Text('Blood Group'),
                      underline: SizedBox(),
                      onChanged: (newValue) {
                        setState(() {
                          this._currentBloodGroupSelected = newValue.toString();
                          post.blood_group = this._currentBloodGroupSelected;
                        });
                      },
                      value: _currentBloodGroupSelected,
                    ),
                    DropdownButton(
                      items: _genderGroup
                          .map(
                            (String dropdownMenuStringItem) => DropdownMenuItem(
                              child: Text(dropdownMenuStringItem),
                              value: dropdownMenuStringItem,
                            ),
                          )
                          .toList(),
                      hint: Text('Gender'),
                      onChanged: (newValue) {
                        setState(() {
                          _currentGenderGroupSelected = newValue.toString();
                          post.gender = _currentGenderGroupSelected;
                        });
                      },
                      value: _currentGenderGroupSelected,
                    ),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //         labelText: 'Gender',
                //         contentPadding: EdgeInsets.all(20),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10))),
                //     onSaved: (val) => post.gender = val!,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'title field cannot be empty';
                //       }
                //       return null;
                //     },
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //         labelText: 'Blood Group',
                //         contentPadding: EdgeInsets.all(20),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10))),
                //     onSaved: (val) => post.blood_group = val!,
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'title field cannot be empty';
                //       } else if (value.length > 16) {
                //         return 'title cannot be greater than 16 characters';
                //       }
                //       return null;
                //     },
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Location',
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onSaved: (val) => post.location = val!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'title field cannot be empty';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onSaved: (val) => post.email = val!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'title field cannot be empty';
                      } else if (value.length > 16) {
                        return 'title cannot be greater than 16 characters';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Mobile',
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onSaved: (val) => post.mobile = val!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'title field cannot be empty';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            insertPost();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Search()));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          tooltip: 'Add a post'),
    );
  }

  void insertPost() {
    final FormState? form = formkey.currentState;
    if (form!.validate()) {
      form.save();
      form.reset();
      PostService postService = PostService(post.toMap());
      postService.Addpost();
    }
  }
}

// Form(
// key: formkey,
// child: Padding(
// padding: EdgeInsets.only(
// left: 30,
// right: 30,
// ),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// TextFormField(
// decoration: InputDecoration(labelText: 'First Name',contentPadding: EdgeInsets.all(15),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
// onSaved: (val) => post.first_name = val!,
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'title field cannot be empty';
// }else if(value.length > 16){
// return 'title cannot be greater than 16 characters';
// }
// return null;
// },
// ),
// TextFormField(
// decoration: InputDecoration(labelText: 'Last Name',contentPadding: EdgeInsets.all(15),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
// onSaved: (val) => post.last_name = val!,
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'title field cannot be empty';
// }else if(value.length > 16){
// return 'title cannot be greater than 16 characters';
// }
// return null;
// },
// ),
//
// TextFormField(
// decoration: InputDecoration(labelText: 'Age',contentPadding: EdgeInsets.all(15),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
// onSaved: (val) => post.age = val! as int,
//     validator: (value) {
// if (value == null || value.isEmpty) {
// return 'title field cannot be empty';
// }else if(value.length > 2){
// return 'title cannot be greater than 2 characters';
// }
// return null;
// },
// ),
// TextFormField(
// decoration: InputDecoration(labelText: 'Location',contentPadding: EdgeInsets.all(15),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
// onSaved: (val) => post.location = val!,
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'title field cannot be empty';
// }else if(value.length > 24){
// return 'title cannot be greater than 16 characters';
// }
// return null;
// },
// ),
// TextFormField(
// decoration: InputDecoration(labelText: 'Email',contentPadding: EdgeInsets.all(15),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
// onSaved: (val) => post.email = val!,
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'title field cannot be empty';
// }else if(value.length > 16){
// return 'title cannot be greater than 16 characters';
// }
// return null;
// },
// ),
// TextFormField(
// decoration: InputDecoration(labelText: 'Mobile',contentPadding: EdgeInsets.all(15),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
// onSaved: (val) => post.mobile = val! as int,
//     validator: (value) {
// if (value == null || value.isEmpty) {
// return 'title field cannot be empty';
// }else if(value.length > 1){
// return 'title cannot be greater than 16 characters';
// }
// return null;
// },
// ),
// FlatButton(
// onPressed: () {
// setState(() {
// insertPost();
// Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Search()));
// });
// },
// child: Text(
// 'SUBMIT',
// style: TextStyle(fontSize: 16, color: Colors.white),
// ),
// color: Colors.red,
// padding:
// EdgeInsets.only(left: 143, right: 143, top: 10, bottom: 10),
// )
// ],
// ),
// ),
// ),
