with Glade.XML;use Glade.XML;
with System; use System;
-- module permettant l'interaction avec la boucle événementielle principale
with Gtk.Main;
-- pour les boites de dialogue
with Gtkada.Dialogs;use Gtkada.Dialogs;
-- module GtkAda pour le composant fenêtre et les autres
with Gtk.Window; use Gtk.Window;


package body P_window_enregville is

window : Gtk_Window;

procedure charge is
XML : Glade_XML;
begin
	Glade.XML.Gtk_New(XML, "src/ihm/enregVilles.glade");
	window := Gtk_Window(Get_Widget(XML,"windowEnregVilles"));
	
	Glade.XML.signal_connect(XML,"on_buttonQuitter_clicked",ferme_win_enregVille'address,null_address );
	Glade.XML.signal_connect(XML,"on_buttonEnregistrer_clicked",enregVille'address,null_address );

end charge;

procedure ferme_win_enregVille (widget : access Gtk_Widget_Record'Class)is
begin
  destroy (window);
end ferme_win_enregVille;


procedure enregVille(widget : access Gtk_Widget_Record'Class) is

rep : Message_Dialog_Buttons;
begin

	rep:=Message_Dialog ("La ville est enregistrée");

end enregVille;

end P_window_enregville ;