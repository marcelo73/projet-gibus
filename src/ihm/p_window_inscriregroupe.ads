with Gtk.Widget; use Gtk.Widget;
package P_window_inscrireGroupe is

procedure charge;
procedure ferme_win_inscrireGroupe (widget : access Gtk_Widget_Record'Class);
procedure inscrireGroupe (widget : access Gtk_Widget_Record'Class);
procedure msgGroupe(widget : access Gtk_Widget_Record'Class);
end P_window_inscrireGroupe;