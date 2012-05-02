with Glade.XML;use Glade.XML;
with System; use System; -- module permettant l'interaction avec la boucle événementielle principale
with Gtk.Main; -- pour les boites de dialogue
with Gtkada.Dialogs;use Gtkada.Dialogs; -- module GtkAda pour le composant fenêtre et les autres
with Gtk.Window; use Gtk.Window;
with Gtk.Button; use Gtk.Button;
with Gtk.Gentry; use Gtk.Gentry;

package body P_window_creerfestival2 is

	window : Gtk_Window;
	butAnnuler1,butAnnuler2, butEnregistrer1,butEnregistrer2  : Gtk_Button;
	entry1,entry2,entry3,entry4 : Gtk_Gentry;

	procedure charge is
		XML : Glade_XML;
	begin
		
		Glade.XML.Gtk_New(XML, "src/ihm/2-creerFestival.glade");
		window := Gtk_Window(Get_Widget(XML, "windowCreerFestival"));
		
		--affectation des boutons
		butAnnuler1 := Gtk_button(Get_Widget(XML, "buttonAnnuler1"));
		butAnnuler2 := Gtk_button(Get_Widget(XML, "buttonAnnuler2"));
		butEnregistrer1 := Gtk_button(Get_Widget(XML, "buttonEnregistrer1"));
		butEnregistrer2 := Gtk_button(Get_Widget(XML, "buttonEnregistrer2"));

		--affectattion des entry
		entry1 :=Gtk_Entry(Get_Widget(XML, "entry1"));
		entry2 :=Gtk_Entry(Get_Widget(XML, "entry2"));
		entry3 :=Gtk_Entry(Get_Widget(XML, "entry3"));
		entry4 :=Gtk_Entry(Get_Widget(XML, "entry4"));

		--signal des boutons
		Glade.XML.signal_connect(XML, "on_buttonAnnuler1_clicked", ferme'address,null_address);
		Glade.XML.signal_connect(XML, "on_buttonAnnuler2_clicked", ferme'address,null_address);
		Glade.XML.signal_connect(XML, "on_buttonEnregistrer1_clicked", affRegion2'address,null_address);
		Glade.XML.signal_connect(XML, "on_buttonEnregistrer2_clicked", enregistrer'address,null_address);
		
	end charge;

	procedure ferme (widget : access Gtk_Widget_Record'Class) is
	begin
		destroy (window);
	end ferme ;
	
	procedure enregistrer (widget : access Gtk_Widget_Record'Class)is
	
		rep : Message_Dialog_Buttons;
	begin
		rep:=Message_Dialog ("Le festival est enregistrée");
		destroy (window);
	end enregistrer;


	
	procedure affRegion2(widget : access Gtk_Widget_Record'Class)is
	begin
	 
	
		set_sensitive(butAnnuler1, false);
		set_sensitive(butEnregistrer1, false);
		set_sensitive(butAnnuler2, true);
		set_sensitive(butEnregistrer2, true);
		
		set_sensitive(entry1,true);
		set_sensitive(entry2,true);
		set_sensitive(entry3,true);
		set_sensitive(entry4,true);



	end affRegion2;
	

end P_window_creerfestival2;