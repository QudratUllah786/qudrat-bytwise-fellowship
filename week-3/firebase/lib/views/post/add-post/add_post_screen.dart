import 'package:firebase/view-model/post/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../resources/color/color.dart';
import '../../../resources/components/round_button.dart';
import '../../../utils/utils.dart';
class AddPostView extends StatefulWidget {
  const AddPostView({Key? key}) : super(key: key);

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  late PostViewModel postViewModel;
  final databaseRef = FirebaseDatabase.instance.ref('Students');
  @override
  void initState(){

    postViewModel = Get.put(PostViewModel());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_post'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              maxLines: 4,
              controller: postViewModel.addPostController,
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            Obx(
              ()=> RoundButton(
                loading: postViewModel.loading.value,
                txt: 'Post',
                onTap: (){
                  postViewModel.loading.value = true;
                  databaseRef.child(
                      DateTime.now().microsecondsSinceEpoch.toString()).set({
                    'id':DateTime.now().microsecondsSinceEpoch.toString(),
                    'name':postViewModel.addPostController.text.trim(),
                  }).then((value) {
                    postViewModel.loading.value = false;
                    Utils.snackBar
                      ('po_btn'.tr, 'post_added'.tr,
                        SnackPosition.BOTTOM, AppColors.redColor,AppColors.whiteColor);
                        postViewModel.addPostController.clear();
                  }).onError((error, stackTrace) {
                    postViewModel.loading.value = false;
                    Utils.snackBar
                      ('Error', error.toString(),
                        SnackPosition.BOTTOM, AppColors.redColor,AppColors.whiteColor);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
