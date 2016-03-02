using Gtk;
using WebKit;

[GtkTemplate (ui = "/de/uni-frankfurt/namegoeshere/ui/browserwindow.ui")]
public class BrowserWindow: ApplicationWindow {

	[GtkChild] BrowserNotebook notebook;

	public BrowserWindow(Gtk.Application app) {
		Object (application: app);
		stdout.printf("haha");
		this.show_all();
	}

	[GtkCallback]
	private void on_btn_newtab_clicked(ToolButton toolbutton) {
		notebook.append_page(new BrowserTab(), new BrowserTabSign());
		notebook.show_all();
	}

	[GtkCallback]
	private void on_urlbar_activate(Entry entry) {
		notebook.get_current_webview().load_uri("https://google.com");
	}
}
