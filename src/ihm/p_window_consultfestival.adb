with Glade.XML;use Glade.XML;
with System; use System;
-- module permettant l'interaction avec la boucle événementielle principale
with Gtk.Main;
-- pour les boites de dialogue
with Gtkada.Dialogs;use Gtkada.Dialogs;
-- module GtkAda pour le composant fenêtre et les autres
with Gtk.Window; use Gtk.Window;
with Gtk.Button; use Gtk.Button;

package body P_window_consultFestival is


window : Gtk_Window;
butAnnuler, butRechercher, butFermer : Gtk_Button;


procedure charge is
XML : Glade_XML;
begin
	Glade.XML.Gtk_New(XML, "src/ihm/consulterFestival.glade");

	window := Gtk_Window(Get_Widget(XML,"windowConsulterFestival"));

	butAnnuler := Gtk_button(Get_Widget(XML,"buttonAnnuler"));
	butRechercher := Gtk_button(Get_Widget(XML,"buttonRechercher"));
	butFermer := Gtk_button(Get_Widget(XML,"buttonFermer"));
	Glade.XML.signal_connect(XML,"on_buttonRechercher_clicked",afficheFestival'address,null_address );
	Glade.XML.signal_connect(XML,"on_buttonFermer_clicked",ferme_win_affFestival'address,null_address );
	Glade.XML.signal_connect(XML,"on_buttonAnnuler_clicked",ferme_win_affFestival'address,null_address );

end charge;

procedure ferme_win_affFestival (widget : access Gtk_Widget_Record'Class)is
begin
  destroy (window);
end ferme_win_affFestival ;

procedure afficheFestival (widget : access Gtk_Widget_Record'Class)is
begin
 set_sensitive(butAnnuler, false);
 set_sensitive(butRechercher, false);
 set_sensitive(butFermer, true);
end afficheFestival;

end P_window_consultFestival;