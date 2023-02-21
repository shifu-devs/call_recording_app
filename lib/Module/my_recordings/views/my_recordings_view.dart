import '/utills/customs/textfeilds.dart';
import '/utills/customs/app_message/toast_message.dart';
import '/module/my_recordings/view_model/my_recordings_list_view_model.dart';
import '/module/player/views/player_view.dart';
import '/utills/app_theme/AppColors.dart';
import '/utills/app_theme/app_config.dart';
import '/utills/customs/app_bar/my_app_bar.dart';
import '/utills/voice_tile/voice_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRecordingsView extends StatefulWidget {
  MyRecordingsView({Key? key}) : super(key: key);

  @override
  State<MyRecordingsView> createState() => _MyRecordingsViewState();
}

class _MyRecordingsViewState extends State<MyRecordingsView> {
  final _controller = Get.put(MyRecordingsListViewModel());

  // final audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomAppBar().simpleAppBar(
          context: context,
          title: "My Recordings",
          textColor: AppColors.background,
          isCenterTitle: true,
          isBackButton: true,
          backOnPressed: () {
            Get.back();
          },
        ),
        body: Container(
          padding: EdgeInsets.only(top: AppConfig(context).height * 0.01),
          child: ListView.builder(
            itemCount: _controller.listOfVoices.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              var i = _controller.listOfVoices;
              // print(i[index].createdAt.toString());
              DateTime createdAt =
                  DateTime.fromMillisecondsSinceEpoch(i[index].createdAt);
              final hour = createdAt.hour.toString();
              final mint = createdAt.minute.toString();
              final sec = createdAt.second.toString();
              final day = createdAt.day.toString();
              final month = createdAt.month.toString();
              final year = createdAt.year.toString();
              final dateTime = "$year/$month/$day $hour:$mint:$sec";
              bool isFav = i[index].isFav.toString() == "1" ? true : false;
              return _controller.isSearch.value
                  ? i[index].title.toString().toLowerCase().startsWith(
                          _controller.searchingTextField.value.text
                              .toString()
                              .toLowerCase())
                      ? Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            _controller.deleteRecording(index);
                          },
                          confirmDismiss: (direction) async {
                            bool val = false;

                            await ToastMessage().defaultYesNoDialouge(
                              "Are you sure to delete '${i[index].title}' recording. Changes in database is permanent.",
                              onConfirmPressed: () {
                                val = true;
                                Get.back();
                                _controller.listOfVoices.removeAt(index);
                              },
                              onCancelPressed: () {
                                val = false;
                                Get.back();
                              },
                            );
                            return val;
                          },
                          background: Container(
                            color: Colors.red,
                            child: const Center(
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                          child: VoiceTile().allCallsTile(
                            context: context,
                            callerName: i[index].title,
                            callDateTime: dateTime,
                            callDuration:
                                _controller.durationOfVoicesList[index],
                            isFav: isFav,
                            isGoing: true,
                            isRecording: true,
                            clickFavIcon: () {
                              _controller.favouriteToogle(
                                i[index].id,
                                i[index].isFav,
                                index,
                              );
                            },
                            onTapTile: () async {
                              final result = await Get.to(() => PlayerView(
                                    data: i[index],
                                  ));
                              if (result['isDel']) {
                                i.remove(result['data']);
                                _controller.listOfVoices.remove(result['data']);
                              } else {
                                i[index] = result['data'];
                              }
                            },
                          ))
                      : const SizedBox()
                  : Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        _controller.deleteRecording(index);
                      },
                      confirmDismiss: (direction) async {
                        bool val = false;

                        await ToastMessage().defaultYesNoDialouge(
                          "Are you sure to delete '${i[index].title}' recording. Changes in database is permanent.",
                          onConfirmPressed: () {
                            val = true;
                            Get.back();
                            _controller.listOfVoices.removeAt(index);
                          },
                          onCancelPressed: () {
                            val = false;
                            Get.back();
                          },
                        );
                        return val;
                      },
                      background: Container(
                        color: Colors.red,
                        child: const Center(
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ),
                      child: VoiceTile().allCallsTile(
                        context: context,
                        callerName: i[index].title,
                        callDateTime: dateTime,
                        callDuration: _controller.durationOfVoicesList[index],
                        isFav: isFav,
                        isGoing: true,
                        isRecording: true,
                        clickFavIcon: () {
                          _controller.favouriteToogle(
                            i[index].id,
                            i[index].isFav,
                            index,
                          );
                        },
                        onTapTile: () async {
                          final result = await Get.to(() => PlayerView(
                                data: i[index],
                              ));
                          if (result['isDel']) {
                            i.remove(result['data']);
                            _controller.listOfVoices.remove(result['data']);
                          } else {
                            i[index] = result['data'];
                          }
                        },
                      ));
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: 50,
          width:
              _controller.isSearch.value ? AppConfig(context).width * 0.92 : 50,
          decoration: BoxDecoration(
            color: AppColors.primaryColor(),
            borderRadius:
                BorderRadius.circular(_controller.isSearch.value ? 5 : 35),
          ),
          child: !_controller.isSearch.value
              ? InkWell(
                  onTap: () {
                    _controller.isSearch.value = true;
                  },
                  child: const Center(
                    child: Icon(
                      Icons.search_outlined,
                      color: AppColors.background,
                      size: 25,
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppTextFormFiled(
                          cntr: _controller.searchingTextField.value,
                          onChange: (value) {
                            setState(() {});
                          },
                          width: AppConfig(context).width * 0.80,
                          text: "My voice ...",
                          fontweight: FontWeight.w400,
                          textColor: Colors.white,
                          cursorColor: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _controller.isSearch.value = false;
                          _controller.searchingTextField.value.text = "";
                        },
                        child: const Center(
                          child: Icon(
                            Icons.close,
                            color: AppColors.background,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
