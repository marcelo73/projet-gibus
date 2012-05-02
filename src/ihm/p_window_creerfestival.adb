with Glade.XML;use Glade.XML;
with System; use System;
-- module permettant l'interaction avec la boucle événementielle principale
with Gtk.Main;
-- pour les boites de dialogue
with Gtkada.Dialogs;use Gtkada.Dialogs;
-- module GtkAda pour le composant fenêtre et les autres
with Gtk.Window; use Gtk.Window;
with Gtk.Button; use Gtk.Button;

package body P_window_creerfestival is

	rep : Message_Dialog_Buttons;
	window : Gtk_Window;
	butAnnuler1, butAnnuler2, butValider1, butValider2 : Gtk_Button;

	procedure charge is
		XML : Glade_XML;
	begin

		Glade.XML.Gtk_New(XML, "src/ihm/creerfestival.glade");
		
		window := Gtk_Window(Get_Widget(XML,"windowCreerFestival"));

		butAnnuler1 := Gtk_button(Get_Widget(XML,"buttonAnnuler1"));
		butAnnuler2 := Gtk_button(Get_Widget(XML,"buttonAnnuler2"));
		butValider2 := Gtk_button(Get_Widget(XML,"buttonValider2"));
		butValider1 := Gtk_button(Get_Widget(XML,"buttonValider1"));
		Glade.XML.signal_connect(XML,"on_buttonValider1_clicked",creerFestival'address,null_address );
		Glade.XML.signal_connect(XML,"on_buttonValider2_clicked",enregFestival'address,null_address );
		Glade.XML.signal_connect(XML,"on_buttonAnnuler1_clicked",ferme_win_creerFestival'address,null_address );
		Glade.XML.signal_connect(XML,"on_buttonAnnuler2_clicked",ferme_win_creerFestival'address,null_address );
	end charge;


	procedure ferme_win_creerFestival (widget : access Gtk_Widget_Record'Class)is
	begin
	  destroy (window);
	end ferme_win_creerFestival ;



	procedure creerFestival (widget : access Gtk_Widget_Record'Class)is
	begin
		set_sensitive(butAnnuler1, false);
 		set_sensitive(butValider1, false);
 		set_sensitive(butAnnuler2, true);
 		set_sensitive(butValider2, true);
	end creerFestival;


	procedure enregFestival(widget : access Gtk_Widget_Record'Class)is
		rep : Message_Dialog_Buttons;
	begin
		rep:=Message_Dialog ("Le festival est bien créé");
	end enregFestival;

end P_window_creerfestival;
