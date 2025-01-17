import 'package:firebase_chat/common/values/colors.dart';
import 'package:firebase_chat/pages/message/chat/widgets/chat_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 176, 106, 231),
              Color.fromARGB(255, 166, 112, 231),
              Color.fromARGB(255, 131, 123, 231),
              Color.fromARGB(255, 104, 132, 231),
            ],
            transform: GradientRotation(90),
          ),
        ),
      ),
      title: Container(
        padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
              child: InkWell(
                child: SizedBox(
                  height: 44.w,
                  width: 44.w,
                  child: CachedNetworkImage(
                    imageUrl: controller.state.to_avatar.value,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 44.w,
                      width: 44.w,
                      margin: null,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(44.w)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          )),
                    ),
                    errorWidget: (context, url, error) => Image(
                      image: AssetImage('assets/images/feature-1.png'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Container(
              width: 180.w,
              padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
              child: Row(children: [
                SizedBox(
                  width: 180.w,
                  height: 44.w,
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.state.to_name.value,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryBackground,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          "unknown location",
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.normal,
                            color: AppColors.primaryBackground,
                            fontSize: 14.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              children: [
                ChatList(),
                Positioned(
                  bottom: 0.h,
                  height: 50.h,
                  child: Container(
                    width: 360.w,
                    height: 50.h,
                    color: AppColors.primaryBackground,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 217.w,
                          height: 50.h,
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            controller: controller.textController,
                            autofocus: false,
                            focusNode: controller.contentNode,
                            decoration: const InputDecoration(
                                hintText: "  Send Messages... "),
                          ),
                        ),
                        Container(
                          height: 30.h,
                          width: 30.w,
                          margin: EdgeInsets.only(left: 5.w),
                          child: GestureDetector(
                            child: new Icon(
                              Icons.photo_outlined,
                              size: 35.w,
                              color: Colors.blue,
                            ),
                            onTap: () {},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.w, top: 3.h),
                          width: 65.w,
                          height: 35.h,
                          child: ElevatedButton(
                            child: Text("send"),
                            onPressed: () {
                              controller.sendMessage();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
