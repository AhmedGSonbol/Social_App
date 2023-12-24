import 'package:flutter/material.dart';
import 'package:social_app/Shared/Components/Components.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: defaultAppBar(
          context: context,
        title: 'Create Post',
        actions: 
        [
          myTextButton(text: 'Post', function: (){})
        ]
      ),
    );
  }
}
