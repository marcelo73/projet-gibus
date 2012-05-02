with Glade.XML;use Glade.XML;
with System; use System;
-- module permettant l'interaction avec la boucle événementielle principale
with Gtk.Main;
-- pour les boites de dialogue
with Gtkada.Dialogs;use Gtkada.Dialogs;
-- module GtkAda pour le composant fenêtre et les autres
with Gtk.Window; use Gtk.Window;
with Gtk.Button; use Gtk.Button;

package body P_window_programmerfestival is


window : Gtk_Window;
butAnnuler1,butAnnuler2, butValider, butEnregistrer : Gtk_Button;
butDown1,butUp1,butDown2,butUp2 : Gtk_Button;


procedure charge is
XML : Glade_XML;
begin
	Glade.XML.Gtk_New(XML, "src/ihm/programmerfestival.glade");

	window := Gtk_Window(Get_Widget(XML,"windowProgrammerFestival"));

	butAnnuler1 := Gtk_button(Get_Widget(XML,"buttonAnnuler1"));
	butAnnuler2:= Gtk_button(Get_Widget(XML,"buttonAnnuler2"));
	butValider := Gtk_button(Get_Widget(XML,"buttonValider"));
	butEnregistrer := Gtk_button(Get_Widget(XML,"buttonEnregistrer"));
	butDown1 := Gtk_button(Get_Widget(XML,"buttonDown1"));
	butUp1 := Gtk_button(Get_Widget(XML,"buttonUp1"));
	butDown2 := Gtk_button(Get_Widget(XML,"buttonDown2"));
	butUp2 := Gtk_button(Get_Widget(XML,"buttonUp2"));
	
	
	Glade.XML.signal_connect(XML,"on_buttonValider_clicked",programmerFestival'address,null_address );
	Glade.XML.signal_connect(XML,"on_buttonEnregistrer_clicked",msgProgrammer'address,null_address );
	Glade.XML.signal_connect(XML,"on_buttonAnnuler1_clicked",ferme_win_programmerFestival'address,null_address );
	Glade.XML.signal_connect(XML,"on_buttonAnnuler2_clicked",ferme_win_programmerFestival'address,null_address );

end charge;

procedure ferme_win_programmerFestival (widget : access Gtk_Widget_Record'Class)is
begin
  destroy (window);
end  ferme_win_programmerFestival;

procedure programmerFestival (widget : access Gtk_Widget_Record'Class)is
begin
 set_sensitive(butAnnuler1, false);
 set_sensitive(butValider, false);
 set_sensitive(butAnnuler2, true);
 set_sensitive(butEnregistrer, true);
 set_sensitive(butUp1, true);
 set_sensitive(butUp2, true);
 set_sensitive(butDown1, true);
 set_sensitive(butDown2, true);
 
end programmerFestival;

procedure msgProgrammer(widget : access Gtk_Widget_Record'Class) is

rep : Message_Dialog_Buttons;
begin

	rep:=Message_Dialog ("Le festival est programmé");
	destroy (window);
end msgProgrammer;

end P_window_programmerfestival;