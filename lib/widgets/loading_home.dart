import 'package:compass/widgets/loading_page.dart';
import 'package:flutter/material.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Theme.of(context).disabledColor),
                          width: MediaQuery.of(context).size.width * 0.12,
                          height: MediaQuery.of(context).size.width * 0.12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Theme.of(context).disabledColor),
                                width: 100,
                                height: 20,
                              ),
                              SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Theme.of(context).disabledColor),
                                width: 150,
                                height: 15,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Theme.of(context).disabledColor),
                      width: 100,
                      height: 40,
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Theme.of(context).disabledColor),
                          width: 200,
                          height: 30,
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Theme.of(context).disabledColor),
                          width: 100,
                          height: 30,
                        ),
                        const Divider()
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Theme.of(context).disabledColor),
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).disabledColor),
                  width: 250,
                  height: 20,
                  margin: const EdgeInsets.only(top: 10),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).disabledColor),
                  width: 300,
                  height: 20,
                  margin: const EdgeInsets.only(top: 10),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).disabledColor),
                  width: 200,
                  height: 20,
                  margin: const EdgeInsets.only(top: 10),
                ),
                const SizedBox(height: 10),
                const Divider(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).disabledColor),
                  width: double.infinity,
                  height: 100,
                  margin: const EdgeInsets.only(top: 10),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Theme.of(context).disabledColor),
                  width: double.infinity,
                  height: 100,
                  child: LoadingPage(
                    tagline:
                        "Patience pays off, precise data loading in progress...",
                  ),
                  margin: const EdgeInsets.only(top: 10),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).disabledColor),
                  width: double.infinity,
                  height: 100,
                  margin: const EdgeInsets.only(top: 10),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
