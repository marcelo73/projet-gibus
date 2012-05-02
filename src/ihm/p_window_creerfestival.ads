with Gtk.Widget; use Gtk.Widget;
package P_window_creerfestival is

procedure charge;
procedure ferme_win_creerFestival (widget : access Gtk_Widget_Record'Class);
procedure creerFestival (widget : access Gtk_Widget_Record'Class);
procedure enregFestival(widget : access Gtk_Widget_Record'Class);
end P_window_creerfestival;