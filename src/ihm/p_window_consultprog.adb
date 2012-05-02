with Glade.XML;use Glade.XML;
with System; use System;
-- module permettant l'interaction avec la boucle événementielle principale
with Gtk.Main;
-- pour les boites de dialogue
with Gtkada.Dialogs;use Gtkada.Dialogs;
-- module GtkAda pour le composant fenêtre et les autres
with Gtk.Window; use Gtk.Window;
with Gtk.Button; use Gtk.Button;

package body P_window_consultProg is


window : Gtk_Window;
butAnnuler, butConsulter, butFermer : Gtk_Button;


procedure charge is
XML : Glade_XML;
begin
	Glade.XML.Gtk_New(XML, "src/ihm/consultProgramme.glade");

	window := Gtk_Window(Get_Widget(XML,"windowConsultprog"));

	butAnnuler := Gtk_button(Get_Widget(XML,"buttonAnnuler"));
	butConsulter := Gtk_button(Get_Widget(XML,"buttonConsulter"));
	butFermer := Gtk_button(Get_Widget(XML,"buttonFermer"));
	
	Glade.XML.signal_connect(XML,"on_buttonConsulter_clicked",afficheProg'address,null_address );
	Glade.XML.signal_connect(XML,"on_buttonFermer_clicked",ferme_win_affProg'address,null_address );
	Glade.XML.signal_connect(XML,"on_buttonAnnuler_clicked",ferme_win_affProg'address,null_address );

end charge;

procedure ferme_win_affProg (widget : access Gtk_Widget_Record'Class)is
begin
  destroy (window);
end ferme_win_affProg ;

procedure afficheProg (widget : access Gtk_Widget_Record'Class)is
begin
 set_sensitive(butAnnuler, false);
 set_sensitive(butConsulter, false);
 set_sensitive(butFermer, true);
end afficheProg;

end P_window_consultProg;