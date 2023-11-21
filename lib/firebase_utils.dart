import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diabetes_app/model/user_info.dart';

class FirebaseUtils {
  static CollectionReference<UserInfo> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection(UserInfo.collectionName)
        .withConverter<UserInfo>(
            fromFirestore: (snapshot, options) =>
                UserInfo.fromFireStore(snapshot.data()!),
            toFirestore: (info, options) => info.toFireStore());
  }

  static Future<void> addUserInfoToFireStore(UserInfo info) {
    var taskCollection = getTaskCollection(); //create collection
    var docRef = taskCollection.doc(); //create document
    info.id = docRef.id; //auto id
    return docRef.set(info); // take info and put it in firebase
  }

/*static Stream<QuerySnapshot<UserInfo>> getTasks(DateTime date) {
    return getTaskCollection()
        .where("dateTime",
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

   */
}
