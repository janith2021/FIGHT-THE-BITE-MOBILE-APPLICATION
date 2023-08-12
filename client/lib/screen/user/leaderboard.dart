import 'package:profile_photo/profile_photo.dart';

import '../../const/all_imports.dart';

class LeaderBoard extends StatelessWidget {
  static String get routename => "villager/leaderboard";
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Padding(
        padding: EdgeInsets.all(AllDimensions.px30),
        child:  Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(                  
                  backgroundImage: NetworkImage("https://img.freepik.com/premium-vector/businessman-avatar-cartoon-character-profile_18591-50585.jpg?w=740",),
                  radius: AllDimensions.px50,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(             
                  backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-vector/teenage-boy-with-black-hair-cartoon-character_1308-133556.jpg?w=360&t=st=1691846618~exp=1691847218~hmac=b5a1fdabab14200b3b27b316332aac1c2dcec2280c866e33d7b4f1a4cb4867c5",
                  ),
                  radius: AllDimensions.px50,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-vector/isolated-young-handsome-man-different-poses-white-background-illustration_632498-855.jpg?w=740&t=st=1691850330~exp=1691850930~hmac=a2370590d0a0198a3d8922244e6c091e86eaa5f03f345eb69ed1a01e596a4a9b",
                  ),
                  radius: AllDimensions.px50,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
