-------------------------------------------------------------------------------------------------------
-- module gérant la fenêtre principale de l'application
-- à chaque sous-item du menu correspond une procédure handler affichant la fenêtre correspondant à une fonctionnalité
-- un menu "base" est proposé permettant d'initialiser la base, de l'ouvrir et de quitter l'application
-- Auteur :  Annie Culet 2011-2012
-----------------------------------------------------------------------------------------------------
with Gtk.Widget; use Gtk.Widget;

package P_window_princ is

-- procédure qui charge la description de la fenêtre à partir de sa description XML, l'affiche
-- et associe des procédures handler Ada aux noms de handler dans le fihier XML.
procedure charge;

procedure quitter(widget : access Gtk_Widget_Record'Class);
procedure viderTables(widget : access Gtk_Widget_Record'Class); 
procedure affiche_win_enregVille (widget : access Gtk_Widget_Record'Class);
procedure affiche_win_consultProg(widget : access Gtk_Widget_Record'Class);
procedure affiche_win_consultFestival(widget : access Gtk_Widget_Record'Class);
procedure affiche_win_inscrireGroupe(widget : access Gtk_Widget_Record'Class);
procedure affiche_win_programmerFestival(widget : access Gtk_Widget_Record'Class);
procedure affiche_win_creerFestival2(widget : access Gtk_Widget_Record'Class);
procedure affiche_win_consultGroup (widget : access Gtk_Widget_Record'Class);

end P_window_princ;
