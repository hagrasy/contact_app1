import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_app1/controllers/auth_services.dart';
import 'package:contact_app1/controllers/crud_services.dart';
import 'package:contact_app1/views/update_contact.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Stream<QuerySnapshot> stream;
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    stream = CRUDService().getContacts();
    super.initState();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    stream.drain();
    super.dispose();
  }

// function to call the contact url launcher
  callUser(String phone) async {
    String url = "tel:$phone";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw "Could not launch $url";
    }
  }

//   callP (String phone) async{
//   var url = Uri(scheme: "tel", path: phone);
// if(await canLaunchUrl(url)){

//   launchUrl(url);
// }

// search function to perform search

  searchContacts(String search) {
    stream = CRUDService().getContacts(searchQuery: search);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),

        // search box
        bottom: PreferredSize(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * .9,
                  child: TextFormField(
                    onChanged: (value) {
                      searchContacts(value);
                      setState(() {});
                    },
                    focusNode: searchFocusNode,
                    controller: searchController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                      label: const Text("Search"),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                searchController.clear();
                                searchFocusNode.unfocus();
                                stream = CRUDService().getContacts();
                              },
                              icon: const Icon(Icons.close))
                          : null,
                    ),
                  )),
            ),
            preferredSize: Size(MediaQuery.of(context).size.width * 8, 80)),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/add");
          },
          child: const Icon(Icons.person_add)),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                maxRadius: 32,
                child: Text(FirebaseAuth.instance.currentUser!.email
                    .toString()[0]
                    .toUpperCase()),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(FirebaseAuth.instance.currentUser!.email.toString())
            ],
          )),
          ListTile(
            onTap: () {
              AuthService().logout();
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Logged Out")));
              Navigator.pushReplacementNamed(context, '/login');
            },
            leading: const Icon(Icons.logout_outlined),
            title: const Text("Logout"),
          )
        ],
      )),

      // contacts list in home
      body: StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text("Loading"),
            );
          }
          return snapshot.data!.docs.length == 0
              ? const Center(
                  child: Text("No contacts found ..."),
                )
              : ListView(
                  children: snapshot.data!.docs
                      .map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return ListTile(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateContact(
                                          docID: document.id,
                                          name: data["name"],
                                          phone: data["phone"],
                                          email: data["email"],
                                        ))),
                            leading: CircleAvatar(child: Text(data["name"][0])),
                            title: Text(data["name"]),
                            subtitle: Text(data["phone"]),
                            trailing: IconButton(
                                onPressed: () {
                                  callUser(data["phone"]);
                                },
                                icon: const Icon(Icons.call)));
                      })
                      .toList()
                      .cast(),
                );
        },
      ),
    );
  }
}

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  void initState() {
    AuthService().isLoggedIn().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
