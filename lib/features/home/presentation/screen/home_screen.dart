import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_pt_maha_akbar/features/home/domain/entity/post_body.dart';
import 'package:interview_pt_maha_akbar/features/home/presentation/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  ScrollController scrollController = ScrollController();
  int page = 1;
  bool hasNextPage = true;
  bool isLoadNextPage = false;
  bool isFirstLoad = true;
  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  bool isFocus = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (var focus in focusNodes) {
      focus.addListener(() {
        if (focus.hasPrimaryFocus) {
          isFocus = true;
        } else {
          isFocus = false;
        }
      });
    }
    context.read<HomeCubit>().getUserList(page);
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        setState(() {
          page++;
          if (hasNextPage) {
            isLoadNextPage = true;
            getListUser(page);
          }
        });
      }
    });
  }

  void getListUser(int page) {
    context.read<HomeCubit>().getUserList(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final cubit = context.read<HomeCubit>();
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return BlocProvider.value(
                  value: cubit,
                  child: PostBottomSheet(
                    focusNodes: focusNodes,
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    emailController: emailController,
                    isFocus: isFocus,
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('List User'),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
        if (state.isLoadedState && page == 1) {
          setState(() {
            page++;
            getListUser(page);
          });
        }
        if (state.isLoadedState) {
          setState(() {
            isLoadNextPage = false;
            isFirstLoad = false;
          });
        }
        if (state.isLoadedState && state.listUser!.data!.isEmpty) {
          setState(() {
            hasNextPage = false;
          });
        }
        if (state.isErrorState) {
          Fluttertoast.showToast(
            msg: state.errorMessage ?? "Error",
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.red,
          );
        }
      }, builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        if (isFirstLoad) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: scrollController,
                  clipBehavior: Clip.none,
                  itemCount: cubit.listUser.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 2),
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              cubit.listUser[index].avatar ?? '',
                              width: 50,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cubit.listUser[index].id.toString() ?? ''),
                              Text(cubit.listUser[index].email.toString() ?? ''),
                              Text('${cubit.listUser[index].firstName.toString() ?? ''} ${cubit.listUser[index].lastName.toString() ?? ''}'),
                            ],
                          ))
                        ],
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: isLoadNextPage,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}

class PostBottomSheet extends StatelessWidget {
  const PostBottomSheet({
    super.key,
    required this.focusNodes,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.isFocus,
  });

  final List<FocusNode> focusNodes;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final bool isFocus;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          children: [
            Column(
              children: [
                TextFormField(
                  focusNode: focusNodes[0],
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    label: Text("First Name"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: focusNodes[1],
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    label: Text("Last Name"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  focusNode: focusNodes[2],
                  controller: emailController,
                  decoration: const InputDecoration(
                    label: Text("Email"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
                  if (state.isPostedState) {
                    Fluttertoast.showToast(
                      msg: "SUCCESS",
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.green,
                    );

                    context.pop();
                  }
                }, builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context.read<HomeCubit>().postUser(PostBody(
                            email: emailController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                          ));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        "Submit",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  );
                }),
                SizedBox(
                  height: isFocus ? MediaQuery.of(context).viewInsets.bottom : 0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
