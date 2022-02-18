import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const ProfilePage(),
    theme: ThemeData(
        appBarTheme:
            const AppBarTheme(backgroundColor: Color(0xFFf4f7ff), elevation: 0),
        iconTheme: const IconThemeData(color: Colors.black)),
  ));
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf4f7ff),
      appBar: _buildAppBar(context),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 40,
                right: 40,
                top: MediaQuery.of(context).size.height * 0.02),
            child: Stack(
              children: [
                _buildStackContainer(),
                _buildProfileInfo(context),
                _buildBottomBar(context),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          _buildBottom(context)
        ],
      ),
    );
  }

  Expanded _buildBottom(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(35),
            topEnd: Radius.circular(35),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 40, right: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPostTitle(context),
                  _buildPostMenu(),
                ],
              ),
              _buildBottomPosts(context),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildProfileInfo(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(18),
        color: Colors.white,
      ),
      width: 295,
      height: MediaQuery.of(context).size.shortestSide - 130,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircleAvatar(),
                _buildTitleText(context),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            _buildAboutMe(context)
          ],
        ),
      ),
    );
  }

  Container _buildStackContainer() {
    return Container(
      width: 295,
      height: MediaQuery.of(context).size.shortestSide - 100,
      color: Colors.transparent,
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 300,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 35.0, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Profile",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/icons/menu_top.png"),
            )
          ],
        ),
      ),
    );
  }

  Expanded _buildBottomPosts(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ListView(
                shrinkWrap: true,
                children: [
                  _buildPost(context, "I am not okay...",
                      "Amet minim mollit non deserunt ullamco"),
                  const SizedBox(
                    height: 25,
                  ),
                  _buildPost(context, "Rating These Viral",
                      "Amet minim mollit non deserunt ullamco"),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 30,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _buildPostTitle(BuildContext context) {
    return Text(
      "My Posts",
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }

  Row _buildPostMenu() {
    return Row(
      children: [
        IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: const Icon(
              Icons.grid_view_outlined,
              color: Colors.deepOrange,
            )),
        const SizedBox(
          width: 5,
        ),
        IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: Image.asset("assets/icons/menu_bottom.png"))
      ],
    );
  }

  Widget _buildPost(BuildContext context, String title, String body) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 8,
      shadowColor: Colors.grey,
      child: FittedBox(
        child: Row(
          children: [
            Container(
              height: 141,
              width: 92,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.grey,
              ),
            ),
            Column(
              children: [
                FittedBox(
                  child: SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(body),
                          const SizedBox(
                            height: 21,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 4,
                // ),
                // const SizedBox(
                //   width: 200,
                //   child: Text("Amet minim mollit non deserunt ullamco"),
                // ),
                // const SizedBox(
                //   height: 21,
                // ),
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 124,
                          height: 16,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/icons/like.png",
                                scale: 2.5,
                                color: Colors.black,
                              ),
                              Text(
                                "2.1k",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.black),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Image.asset(
                                "assets/icons/time.png",
                                color: Colors.black,
                                scale: 2.5,
                              ),
                              Text(
                                "1hr ago ",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.black),
                              )
                            ],
                          ),
                        ),

                        // ),
                        Padding(
                          padding: const EdgeInsets.only(left: 23),
                          child: Image.asset(
                            "assets/icons/bookmark.png",
                            scale: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Positioned _buildBottomBar(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 30.0), //(x,y)
                blurRadius: 30.0,
              ),
            ],
            color: Colors.deepOrange.shade300,
            borderRadius: BorderRadiusDirectional.circular(18),
          ),
          width: 231,
          height: 68,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(18),
                    color: index == 0 ? Colors.deepOrange : Colors.transparent,
                  ),
                  child: TextButton(
                    style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory),
                    onPressed: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "52",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Post",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.white,
                              ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(18),
                    color: index == 1 ? Colors.deepOrange : Colors.transparent,
                  ),
                  child: TextButton(
                    style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory),
                    onPressed: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "250",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Following",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.white,
                              ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(18),
                    color: index == 2 ? Colors.deepOrange : Colors.transparent,
                  ),
                  child: TextButton(
                    style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory),
                    onPressed: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "4.5",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Followers",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.white,
                              ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _buildTitleText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("@robertfox", style: Theme.of(context).textTheme.bodySmall!),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Robert Fox",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Graphic Designer",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.deepOrange),
        ),
      ],
    );
  }

  Row _buildAboutMe(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About me",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 240,
              child: Text(
                """Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.""",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey.shade600),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container _buildCircleAvatar() {
    return Container(
      width: 84,
      height: 84,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.deepOrange),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: 66,
          height: 66,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 66,
              height: 66,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
