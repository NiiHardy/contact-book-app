import 'package:contact_book_app/contact_details_view.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'contact_list.dart';

class HomeView2 extends StatelessWidget {
  HomeView2({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      "name": "Mira Peck",
      "phone": "1-373-325-2537",
      "email": "mus@google.edu",
      "country": "Ireland",
      "region": "Connacht"
    },
    {
      "name": "Iola Wilson",
      "phone": "272-3419",
      "email": "tellus.non@aol.com",
      "country": "Pakistan",
      "region": "Punjab"
    },
    {
      "name": "Rudyard Vega",
      "phone": "1-619-675-9240",
      "email": "ligula@google.net",
      "country": "South Korea",
      "region": "South Island"
    },
    {
      "name": "Kirsten Mcfadden",
      "phone": "723-5137",
      "email": "id.nunc@outlook.couk",
      "country": "Pakistan",
      "region": "Munster"
    },
    {
      "name": "Scott Burns",
      "phone": "860-2578",
      "email": "nam@protonmail.com",
      "country": "Mexico",
      "region": "Andaman and Nicobar Islands"
    },
    {
      "name": "Oliver Myers",
      "phone": "1-315-566-3358",
      "email": "lorem.eget@outlook.net",
      "country": "Mexico",
      "region": "Aceh"
    },
    {
      "name": "Iona Patrick",
      "phone": "1-427-268-2085",
      "email": "fusce@google.couk",
      "country": "Chile",
      "region": "Kurgan Oblast"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Search by name or number',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recents',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                            contact: Contact(
                                country: 'Ghana',
                                email: 'agshjdg@abc.com',
                                name: 'Kemi Jones',
                                phone: '123456765',
                                region: 'Greater Accra Region'));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/woman.jpg'),
                    ),
                    title: const Text(
                      'Kemi Jones-Larbi',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+2444444442442'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 5,
                    endIndent: 5,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: contact,
                          );
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/woman.jpg'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 5,
                      endIndent: 5,
                      thickness: 2,
                    )
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            ),
          ],
        ),
      ),
    );
  }
}
