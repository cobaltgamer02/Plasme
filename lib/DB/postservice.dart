import 'package:firebase_database/firebase_database.dart';
import 'package:plasma_donor/DB/post.dart';

class PostService {
  String nodename = 'posts';
  FirebaseDatabase database = FirebaseDatabase.instance;
  late DatabaseReference _databaseReference;
  final Map post;
  PostService(this.post);
  Addpost() {
    //this is going to give a reference tot he posts node
    database.reference().child(nodename).push().set(post);
  }

  // DeletePost() {
  //   database.reference().child('$nodename/${post['key']}').remove();
  // }
  //
  // UpdatePost() {
  //   database.reference().child('$nodename/${post['key']}').update({
  //     "first_name": post['first_name'],
  //     "last_name": post['last_name'],
  //     "age": post['age'],
  //     "gender": post['gender'],
  //     "blood group": post['blood group'],
  //     "location": post['location'],
  //     "email": post['email'],
  //     "mobile": post['mobile'],
  //   });
  // }
}
