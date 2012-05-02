-------------------------------------------------------------------------------------------------
-- programme pricipal du projet Une agence de voyage
-- Auteur :  Annie Culet 2009-2010
--------------------------------------------------------------------------------------------------
with Gtk.Main;
-- module de gestion de la fenêtre principale
with p_window_princ; use p_window_princ;

		with Glade.XML;use Glade.XML;
procedure main is
XML : Glade_XML;
  begin
-- initialisation de variables d'environnement
   Gtk.Main.Set_Locale;
-- Initialisation de Gtk
   Gtk.Main.Init;
-- chargement de la description de la fenêtre principale et affichage
   p_window_princ.charge ;
--Lancement de la boucle évènementielle de Gtk
   Gtk.Main.Main;
end main;