import 'package:flutter/material.dart';
import 'package:social_app/Shared/Styles/colors.dart';
import 'package:social_app/Shared/Styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children:
        [
          Card(
            margin: EdgeInsets.all(8.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children:
              [
                Image(
                  image: AssetImage('assets/images/img1.jpg'),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Communicate With Friends',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
          ),

          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context , index) => buildPostItem(context),
            itemCount: 10,
          ),


        ],
      ),
    );
  }

  Widget buildPostItem(context) => Card(
    margin: EdgeInsets.all(8.0),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children:
        [
          Row(
            children:
            [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage('assets/images/img2.jpg'),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ahmed Sonbol',
                          style: TextStyle(
                              height: 1.4
                          ),
                        ),
                        SizedBox(width: 3,),
                        Icon(Icons.check_circle,
                          color: defaultColor,
                          size: 16.0,
                        )
                      ],
                    ),
                    Text('December 21,2023 at 3:11 PM',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            height: 1.4
                        )
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              IconButton(
                icon: Icon(Icons.more_horiz,
                  size: 18.0,),
                onPressed: (){},
              )
            ],
          ),
          //Divider
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),

          //Post Content
          Text('askmxl alsmc lasm lascmk laskc laskcn alscm oqolm lascm lsdkmvlsdkm lsdmklsdm aslmc;alsm aslcm;asmc sdkvjnsdkvn sdjkvnskdjnv skdjnvksnd skdnvksdnv dksncskdnvksd kdncksdn sdkvnl sdkvnsdk ',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          //Tags
          Padding(
            padding: const EdgeInsets.only(
                bottom: 10.0,
                top: 5.0
            ),
            child: Container(

              width: double.infinity,
              child: Wrap(
                children:
                [
                  Container(
                    height: 20.0,
                    child: MaterialButton(
                        minWidth: 1.0,
                        padding: EdgeInsets.zero,
                        child: Text('#flutter',
                          style: TextStyle(
                              color: defaultColor
                          ),),
                        onPressed: (){}),
                  ),
                  Container(
                    height: 20.0,
                    child: MaterialButton(
                        minWidth: 1.0,
                        padding: EdgeInsets.zero,
                        child: Text('#dart',
                          style: TextStyle(
                              color: Colors.blueAccent
                          ),),
                        onPressed: (){}),
                  ),
                  Container(
                    height: 20.0,
                    child: MaterialButton(
                        minWidth: 1.0,
                        padding: EdgeInsets.zero,
                        child: Text('#application',
                          style: TextStyle(
                              color: Colors.blueAccent
                          ),),
                        onPressed: (){}),
                  ),
                  Container(
                    height: 20.0,
                    child: MaterialButton(
                        minWidth: 1.0,
                        padding: EdgeInsets.zero,
                        child: Text('#software_developer',
                          style: TextStyle(
                              color: Colors.blueAccent
                          ),),
                        onPressed: (){}),
                  ),

                ],
                spacing: 5,
              ),
            ),
          ),

          //Post Image
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage('assets/images/img1.jpg'),
                  fit: BoxFit.cover,

                )
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 5
            ),
            child: Row(
              children:
              [

                InkWell(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          IconBroken.Heart,
                          color: Colors.redAccent,
                        ),
                      ),
                      Text('1200',
                        style: Theme.of(context).textTheme.bodySmall,),
                    ],
                  ),
                  onTap: (){},
                ),

                Spacer(),

                InkWell(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          IconBroken.Chat,
                          color: Colors.orange,
                        ),
                      ),
                      Text('521',
                        style: Theme.of(context).textTheme.bodySmall,),
                      SizedBox(width: 5,),
                      Text('comments',
                        style: Theme.of(context).textTheme.bodySmall,),
                    ],
                  ),
                  onTap: (){},
                ),


              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Row(
            children:
            [
              CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/images/img2.jpg'),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: 'Write a comment ...',
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      border: InputBorder.none
                  ),

                ),
              ),
              InkWell(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        IconBroken.Heart,
                        color: Colors.redAccent,
                      ),
                    ),
                    Text('Like',
                      style: Theme.of(context).textTheme.bodySmall,),
                  ],
                ),
                onTap: (){},
              ),
            ],
          )
        ],
      ),
    ),
  );


}
