import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/src/src.dart';

class ListAvatarIcone extends StatefulWidget {
  const ListAvatarIcone({Key? key}) : super(key: key);

  @override
  _ListAvatarIconeState createState() => _ListAvatarIconeState();
}

class _ListAvatarIconeState extends State<ListAvatarIcone> {
  late final talkController = Provider.of<TalkController>(
    context,
    listen: true,
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: talkController.avatarList.length,
        itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: talkController.selectIndex == index ? [const BoxShadow(blurRadius: 0.8, color: AppColors.black, spreadRadius: 2)] : null,
              ),
              child: GestureDetector(
                child: CircleAvatar(child: Image.asset(talkController.avatarList[index])),
                onTap: () {
                  talkController.selecionarIcone(index);
                },
              ),
            )),
      ),
    );
  }
}
