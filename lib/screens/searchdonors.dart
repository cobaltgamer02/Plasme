import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plasma_donor/DB/post.dart';

import '../register.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String nodeName = 'posts';
  FirebaseDatabase _database = FirebaseDatabase.instance;
  List<Post> postsList = <Post>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _database.reference().child(nodeName).onChildAdded.listen(_childAdded);
    _database.reference().child(nodeName).onChildRemoved.listen(_childRemoves);
    _database.reference().child(nodeName).onChildChanged.listen(_childChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donors"),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black45,
        child: Column(
          children: [
            Visibility(
              visible: postsList.isEmpty,
              child: Center(
                  child: Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )),
            ),
            Visibility(
              visible: postsList.isNotEmpty,
              child: Flexible(
                child: FirebaseAnimatedList(
                  query: _database.reference().child('posts'),
                  itemBuilder: (context, DataSnapshot snap,
                      Animation<double> animation, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         ViewPost(postsList[index]),
                            //   ),
                            // );
                          },
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${postsList[index].first_name} ${postsList[index].last_name}',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          trailing:  Text(
                            postsList[index].blood_group,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '${postsList[index].age.toString()} years',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        postsList[index].gender,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),SizedBox(height: 10),
                                  Text(
                                    postsList[index].location,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w300),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Details(),
              ),
            );
          },
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          tooltip: 'Add a post'),
    );
  }

  void _childAdded(Event event) {
    setState(() {
      postsList.add(
        Post.fromSnapshot(event.snapshot),
      );
    });
  }

  void _childRemoves(Event event) {
    var deletedPost =
        postsList.singleWhere((post) => post.key == event.snapshot.key);
    setState(() {
      postsList.removeAt(postsList.indexOf(deletedPost));
    });
  }

  void _childChanged(Event event) {
    var changedPost =
        postsList.singleWhere((post) => post.key == event.snapshot.key);
    setState(() {
      postsList[postsList.indexOf(changedPost)] =
          Post.fromSnapshot(event.snapshot);
    });
  }
}
