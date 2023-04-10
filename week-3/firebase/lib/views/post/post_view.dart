import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../utils/routes/routes_name.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final ref = FirebaseDatabase.instance.ref('Students');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.toNamed(RoutesName.addPostView);

          },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('post'.tr),

      ),
      body: Column(
      //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: StreamBuilder(
              stream:ref.onValue,
                builder: (context,AsyncSnapshot<DatabaseEvent>snapshot){
                  if(!snapshot.hasData){
               return Center(child: CircularProgressIndicator());
                  }
                 else if(snapshot.connectionState == ConnectionState.waiting){
                   return  Center(child: CircularProgressIndicator());
                  }
                else if(snapshot.hasError){
                    return Center(child: CircularProgressIndicator());
                  }
                else{
                    Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
                    List<dynamic> list = [];
                    list.clear();
                    list = map.values.toList();
                  return ListView.builder(
                  //s  shrinkWrap: true,
                      itemCount: snapshot.data!.snapshot.children.length,
                      itemBuilder: (context,index)
                      {
                        return ListTile(
                          title: Text(list[index]['name']),
                          subtitle: Text(list[index]['id']),
                        );
                      });
                }
                }),
          ),
          
          
          
         // FirebaseAnimatedList(
         //   defaultChild: const Center(
         //     child: CircularProgressIndicator(),
         //   ),
         //   shrinkWrap: true,
         //   query: ref,
         //   itemBuilder: (context,snapshot,animation,index){
         //     return ListTile(
         //       title: Text(snapshot.child('name').value.toString()),
         //       subtitle: Text(snapshot.child('id').value.toString()),
         //     );
         //   },
         // )
        ],
      ),
    );
  }
}
