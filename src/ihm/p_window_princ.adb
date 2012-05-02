
-- module permettant de créer dynamiquement les composants à partir de la description XML de l'interface
with Glade.XML;use Glade.XML;
with System; use System;
-- module permettant l'interaction avec la boucle événementielle principale
with Gtk.Main;
-- module GtkAda pour le composant fenêtre
with Gtk.Window; use Gtk.Window;
-- pour les boites de dialogue
with Gtkada.Dialogs;use Gtkada.Dialogs;

with p_window_enregVille;
with p_window_consultProg;
with p_window_consultFestival;
with p_window_inscrireGroupe;
with p_window_programmerfestival;
with p_window_creerfestival2;
with p_window_consultgroup;

package body p_window_princ is

window_princ : Gtk_Window;  -- variable désignant la fenêtre

procedure charge is
XML : Glade_XML;  -- variable référençant l'interface (la fenêtre et tous ses composants)
begin
-- chargement de l'interface à partir du fichier XML
	Glade.XML.Gtk_New(XML, "src/ihm/fenprinc.glade", "windowPrinc");
-- chargement du composant fenêtre de l'interface
	window_princ := Gtk_Window(Get_Widget(XML,"windowPrinc"));
-- connection des différents signaux de l'interface en associant les procédures handler correspondantes
	Glade.XML.signal_connect (XML,"on_windowPrinc_delete_event",quitter'address,null_address);
	Glade.XML.signal_connect (XML,"on_menuitem_init_activate",viderTables'address,null_address);
	Glade.XML.signal_connect(XML,"on_menuitem_quitter_activate",quitter'address,null_address );
	Glade.XML.signal_connect(XML,"on_menuitem_enregVille_activate",affiche_win_enregVille'address,null_address );

	Glade.XML.signal_connect(XML,"on_menuitem_consultProg_activate",affiche_win_consultProg'address,null_address );
	
	Glade.XML.signal_connect(XML,"on_menuitem_consultFestival_activate",affiche_win_consultFestival'address,null_address );
	Glade.XML.signal_connect(XML,"on_menuitem_inscrireGroupe_activate",affiche_win_inscrireGroupe'address,null_address );
	Glade.XML.signal_connect(XML,"on_menuitem_programmerFestival_activate",affiche_win_programmerFestival'address,null_address );
	Glade.XML.signal_connect(XML,"on_menuitem_creerFestival_activate",affiche_win_creerFestival2'address,null_address );
	Glade.XML.signal_connect(XML,"on_menuitem_consulterGroupe_activate",affiche_win_consultGroup'address,null_address );
	
end charge;

-- quitte l'application
procedure quitter(widget : access Gtk_Widget_Record'Class) is

begin
	Gtk.Main.main_quit;
end quitter;

-- détruit le contenu de toutes les tables
procedure viderTables(widget : access Gtk_Widget_Record'Class) is
rep : Message_Dialog_Buttons;

begin
  rep:=Message_Dialog ("Une base existe. Voulez-vous vraiment la détruire ?",confirmation, button_ok or button_no);
  --if rep = button_ok then
	--p_operations.vider_tables ;
	--else rep:=Message_Dialog ("La base est conservée.");
 -- end if;
  rep:=Message_Dialog ("Le contenu de la base est détruit");

end viderTables;


-- affiche la fenêtre pour enregistrer les villes organisatrices
procedure affiche_win_enregVille (widget : access Gtk_Widget_Record'Class) is
begin
	p_window_enregVille.charge;
end affiche_win_enregVille;

-- affiche la fenêtre pour consulter un programme d'un festival
 procedure affiche_win_consultProg (widget : access Gtk_Widget_Record'Class) is
 begin
 	p_window_consultProg.charge;
 end affiche_win_consultProg;
 
--affiche la fenêtre pour consulter un festival
 procedure affiche_win_consultFestival (widget : access Gtk_Widget_Record'Class) is
 begin
 	p_window_consultFestival.charge;
 end affiche_win_consultFestival;

--affiche la fenêtre pour inscrire un groupe
 procedure affiche_win_inscrireGroupe (widget : access Gtk_Widget_Record'Class) is
 begin
 	p_window_inscrireGroupe.charge;
 end affiche_win_inscrireGroupe;

--affiche la fenêtre pour programmer un festival
 procedure affiche_win_programmerFestival(widget : access Gtk_Widget_Record'Class) is
 begin
 	p_window_programmerfestival.charge;
 	
 end affiche_win_programmerFestival;

 --affiche la fenêtre pour creer un festival
 procedure affiche_win_creerFestival2(widget : access Gtk_Widget_Record'Class) is
 begin
 	p_window_creerfestival2.charge;
 	
 end affiche_win_creerFestival2;
 
 --affiche la fenêtre pour consulter un groupe
 procedure affiche_win_consultGroup(widget : access Gtk_Widget_Record'Class) is
 begin
 	p_window_consultgroup.charge;
 	
 end affiche_win_consultGroup;
end p_window_princ;
