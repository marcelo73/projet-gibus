with Glade.XML;use Glade.XML;
with System; use System;
-- module permettant l'interaction avec la boucle événementielle principale
with Gtk.Main;
-- pour les boites de dialogue
with Gtkada.Dialogs;use Gtkada.Dialogs;
-- module GtkAda pour le composant fenêtre et les autres
with Gtk.Window; use Gtk.Window;
with Gtk.Button; use Gtk.Button;

package body P_window_inscrireGroupe is


window : Gtk_Window;
butAnnuler1,butAnnuler2, butRechercher, butValider : Gtk_Button;


procedure charge is
XML : Glade_XML;
begin
	Glade.XML.Gtk_New(XML, "src/ihm/InscrireGroupe.glade");

	window := Gtk_Window(Get_Widget(XML,"WindowInscrireGroupe"));

	butAnnuler1 := Gtk_button(Get_Widget(XML,"buttonAnnuler1"));
	butAnnuler2:= Gtk_button(Get_Widget(XML,"buttonAnnuler2"));
	butRechercher := Gtk_button(Get_Widget(XML,"buttonRechercher"));
	butValider := Gtk_button(Get_Widget(XML,"buttonValider"));
	
	Glade.XML.signal_connect(XML,"on_buttonRechercher_clicked",inscrireGroupe'address,null_address );
	Glade.XML.signal_connect(XML,"on_buttonValider_clicked",msgGroupe'address,null_address );
	Glade.XML.signal_connect(XML,"on_buttonAnnuler1_clicked",ferme_win_inscrireGroupe'address,null_address );
	Glade.XML.signal_connect(XML,"on_buttonAnnuler2_clicked",ferme_win_inscrireGroupe'address,null_address );

end charge;

procedure ferme_win_inscrireGroupe (widget : access Gtk_Widget_Record'Class)is
begin
  destroy (window);
end  ferme_win_inscrireGroupe;

procedure inscrireGroupe (widget : access Gtk_Widget_Record'Class)is
begin
 set_sensitive(butAnnuler1, false);
 set_sensitive(butRechercher, false);
 set_sensitive(butAnnuler2, true);
 set_sensitive(butValider, true);
end inscrireGroupe;

procedure msgGroupe(widget : access Gtk_Widget_Record'Class) is

rep : Message_Dialog_Buttons;
begin

	rep:=Message_Dialog ("Le groupe est enregistrée");
	set_sensitive(butAnnuler1, true);
	set_sensitive(butRechercher, true);
	set_sensitive(butAnnuler2, false);
	set_sensitive(butValider, false);
end msgGroupe;

end P_window_inscrireGroupe;