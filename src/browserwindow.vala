using Gtk;
using WebKit;

[GtkTemplate (ui = "/de/uni-frankfurt/namegoeshere/ui/browserwindow.ui")]
public class BrowserWindow: ApplicationWindow {

	//[GtkChild] BrowserNotebook notebook;
	[GtkChild] Entry urlbar;
	BrowserNotebook browsernotebook;

	public BrowserWindow(Gtk.Application app) {
		Object (application: app);
		this.browsernotebook = new BrowserNotebook(this);
		this.add(this.browsernotebook);
		stdout.printf("haha\n");
		this.show_all();
	}

	[GtkCallback]
	private void on_btn_newtab_clicked(ToolButton toolbutton) {
		browsernotebook.new_tab();
	}

	[GtkCallback]
	private void on_urlbar_activate(Entry entry) {
		string uri = entry.get_text();
		uri = browsernotebook.http_autocorrect(uri);
		browsernotebook.get_current_webview().load_uri(uri);
	}

	[GtkCallback]
	private void on_btn_back_clicked(ToolButton toolbutton) {
		browsernotebook.get_current_webview().go_back();
	}

	[GtkCallback]
	private void on_btn_forward_clicked(ToolButton toolbutton) {
		stdout.printf("lolol\n");
		browsernotebook.get_current_webview().go_forward();
	}

	public void set_entry_text(string text) {
		urlbar.set_text(text);
	}

}
