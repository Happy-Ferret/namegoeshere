using Gtk;

[GtkTemplate (ui = "/de/uni-frankfurt/namegoeshere/ui/browserwindow.ui")]
public class BrowserWindow: ApplicationWindow {

	[GtkChild] Notebook notebook;

	public BrowserWindow(Gtk.Application app) {
		Object (application: app);
		stdout.printf("haha");
		this.show_all();
	}

	[GtkCallback]
	private void on_btn_newtab_clicked(ToolButton toolbutton) {
		notebook.append_page(new BrowserTab(), new BrowserTabSign());
		stdout.printf("lala");
	}

}
