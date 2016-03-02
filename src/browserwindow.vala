using Gtk;
using WebKit;

[GtkTemplate (ui = "/de/uni-frankfurt/namegoeshere/ui/browserwindow.ui")]
public class BrowserWindow: ApplicationWindow {

	//[GtkChild] BrowserNotebook notebook;
	BrowserNotebook browsernotebook;

	public BrowserWindow(Gtk.Application app) {
		Object (application: app);
		this.browsernotebook = new BrowserNotebook();
		this.add(this.browsernotebook);
		stdout.printf("haha");
		this.show_all();
	}

	[GtkCallback]
	private void on_btn_newtab_clicked(ToolButton toolbutton) {
		browsernotebook.new_tab();
		//notebook.new_tab();
	}

	[GtkCallback]
	private void on_urlbar_activate(Entry entry) {
		//notebook.get_current_webview().load_uri("https://google.com");
	}
}
