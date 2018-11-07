import 'package:flutter/material.dart';
import 'package:full_copy_flutter/screens/note_detail.dart';

class NoteList extends StatefulWidget {

	@override
  State<StatefulWidget> createState() {

    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

	List<ProgramItem> myCards = [];


	@override
  Widget build(BuildContext context) {
		myCards.add(new ProgramItem("nahui", "sauci", "blyat", "45", "saf"));
		myCards.add(new ProgramItem("nahui", "sauci", "blyat", "45", "saf"));
		myCards.add(new ProgramItem("nahui", "sauci", "blyat", "45", "saf"));

    return Scaffold(

	    appBar: AppBar(
		    title: Text('Notes'),
	    ),

	    body: getNoteListView(),

	    floatingActionButton: FloatingActionButton(
		    onPressed: () {
		      debugPrint('FAB clicked');
		      navigateToDetail('Add Note');
		    },

		    tooltip: 'Add Note',

		    child: Icon(Icons.add),

	    ),
    );
  }

  ListView getNoteListView() {

		TextStyle titleStyle = Theme.of(context).textTheme.subhead;

		return ListView.builder(
			itemCount: myCards.length,
			itemBuilder: (BuildContext context, int position) {
				return Card(
					color: Colors.white,
					elevation: 2.0,
					child: ListTile(

						leading: CircleAvatar(
							backgroundColor: Colors.yellow,
							child: Icon(Icons.keyboard_arrow_right),
						),

						title: Text(this.myCards[position].title +"\n\t" + this.myCards[position].description),


						subtitle: Text("From: "+this.myCards[position].startHour+" To: "+this.myCards[position].endHour),



						trailing: Icon(Icons.delete, color: Colors.grey,),

						onTap: () {
							debugPrint("ListTile Tapped");
							navigateToDetail('Edit Note');
						},

					),
				);
			},
		);
  }

  void navigateToDetail(String title) {
	  Navigator.push(context, MaterialPageRoute(builder: (context) {
		  return NoteDetail(title);
	  }));
  }
}



abstract class ListItem {}

class ProgramItem implements ListItem {
	final String title;
	final String description;
	final String program;
	final String startHour;
	final String endHour;

	ProgramItem(this.title, this.description, this.program, this.startHour,
			this.endHour);


}







