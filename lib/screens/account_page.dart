import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:marvelwatch/utils/movie_lists.dart';
import 'package:marvelwatch/widgets/horizontal_list.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back)),
                Center(
                  child: Column(children: [
                    const Image(
                      image: AssetImage("assets/images/MarvelLogo.png"),
                      width: 250,
                      height: 136.48,
                    ),
                    const Gap(40),
                    Center(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.account_circle_rounded,
                            color: Colors.white,
                            size: 60,
                          ),
                          Gap(20),
                          Text(
                            "Mrityunjay Shukla",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Gap(10),
                          Text(
                            "shuklamrityunjay60@gmail.com",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    const Gap(60),
                  ]),
                ),
                const Text(
                  "Downloads",
                  style: TextStyle(
                    color: Color(0xff8b8b8b),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(20),
                HorizontalScroll(scrolllist: downloads),
                const Gap(40),
                const Text(
                  "Wishlist",
                  style: TextStyle(
                    color: Color(0xff8b8b8b),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(20),
                HorizontalScroll(scrolllist: wishlist),
                const Gap(60),
                const Text(
                  "Settings",
                  style: TextStyle(
                    color: Color(0xff8b8b8b),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(40),

                // settings
                const Text(
                  "Autoplay Trailers",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Preferred Video Quality",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "720P",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Default Download Quality",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "720P",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Internal Storage",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "Used: 41.51GB",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Gap(5),
                        Text(
                          "Available: 22.49GB",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
                const Gap(40),
                const Text(
                  "Account Settings",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(20),
                const Text(
                  "Manage Devices",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(20),
                const Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
