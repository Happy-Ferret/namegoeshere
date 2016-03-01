using Gtk;

[GtkTemplate (ui = "/de/uni-frankfurt/namegoeshere/ui/browserwindow.ui")]
public class BrowserWindow: ApplicationWindow {

	public BrowserWindow(Gtk.Application app) {
		Object (application: app);
		stdout.printf("haha");
		this.show_all();
	}

}
