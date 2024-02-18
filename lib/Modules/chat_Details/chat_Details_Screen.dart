import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/user_Model.dart';
import 'package:social_app/Shared/Components/Components.dart';
import 'package:social_app/Shared/Styles/appLanguage.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';
import 'package:social_app/Shared/cubit/cubit.dart';
import 'package:social_app/Shared/cubit/states.dart';

class Chat_Details_Screen extends StatelessWidget
{
  late User_Model receiver_Model;

  Chat_Details_Screen({Key? key , required  this.receiver_Model}) : super(key: key);

  var messageController = TextEditingController();

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context)
      {

        AppLang lang = AppLang(context);

        AppCubit.get(context).getMessages(receiverId: receiver_Model.uId!);

        return BlocConsumer<AppCubit,AppStates>(
          listener: (context, state)
          {
            if (state is AppGetMessagesSuccessState)
            {
              scrollController.jumpTo(scrollController.position.maxScrollExtent);
            }
          },
          builder: (context, state)
          {

            var cubit = AppCubit.get(context);

            return Directionality(
              textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
              child: Scaffold(
                appBar:defaultAppBar(
                    context: context,
                    title: buildUserItem(
                      receiver_Model,
                        context,
                        lang,
                      isSmallImg: true
                    ),
                ),

                // AppBar(
                //   titleSpacing: 0.0,
                //
                //   title: Row(
                //     children:
                //     [
                //       CircleAvatar(
                //         radius: 20.0,
                //         backgroundImage: NetworkImage('${receiver_Model.image}'),
                //       ),
                //       SizedBox(width: 15.0,),
                //       Text('${receiver_Model.name}')
                //     ],
                //   ),
                // ),
                body:
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children:
                    [
                      if (cubit.messages.isNotEmpty) Expanded(
                        child: ListView.separated(
                          controller: scrollController,
                          physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index)
                            {
                              if(cubit.messages[index].receiverId != receiver_Model.uId )
                              {
                                return buildReceiverMessages(cubit.messages[index].text!);
                              }
                              else
                              {
                                return buildMyMessages(cubit.messages[index].text!,context);
                              }
                            },
                            separatorBuilder: (context, index) => SizedBox(height: 15.0,),
                            itemCount: cubit.messages.length,
                        ),
                      )

                      else Expanded(
                        child: Center(
                          child: Text(lang.noMessagesYet(),style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15.0)),
                        ),
                      ),

                      mySendMessageSection(
                          context: context,
                          messageController: messageController,
                          onPressed: ()
                          {
                            if(messageController.text.trim().length > 0)
                            {
                              cubit.sendMessage(
                                receiverId: receiver_Model.uId!,
                                datetime: DateTime.now().toString(),
                                text: messageController.text,
                              ).then((value)
                              {
                                messageController.text = '';
                              });
                            }

                          })

                    ],
                  ),
                )
              ),
            );
          },
        );

      },
    );
  }

  Widget buildMyMessages(String message,BuildContext context)
  {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
              ),
              color: defaultColor.withOpacity(0.7)
          ),
          padding: EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0
          ),
          child: Text(message,style: Theme.of(context).textTheme.titleMedium,)),
    );
  }

  Widget buildReceiverMessages(String message)
  {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
              ),
              color: Colors.grey[300]
          ),
          padding: EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0
          ),
          child: Text(message)),
    );
  }
}
