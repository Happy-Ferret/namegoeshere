using Gtk;
using WebKit;

[GtkTemplate (ui = "/de/uni-frankfurt/namegoeshere/ui/browserwindow.ui")]
public class BrowserWindow: ApplicationWindow {

	//[GtkChild] BrowserNotebook notebook;
	[GtkChild] Entry urlbar;
	[GtkChild] ToolButton btn_back;
	[GtkChild] ToolButton btn_forward;
	BrowserNotebook browsernotebook;

	public BrowserWindow(Gtk.Application app) {
		Object (application: app);
		this.browsernotebook = new BrowserNotebook(this);
		Box box = this.get_child() as Box;
		box.add(this.browsernotebook);
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

	private void refresh_ui() {
		// TODO: find more fitting name
		WebView webview = browsernotebook.get_current_webview();
		this.set_entry_text(webview.get_uri());
		if (webview.can_go_back()) {
			btn_back.set_sensitive(true);
		}
		if (webview.can_go_forward()) {
			btn_forward.set_sensitive(true);
		}
	}

	[GtkCallback]
	private void on_btn_back_clicked(ToolButton toolbutton) {
		WebView webview = browsernotebook.get_current_webview();
		browsernotebook.get_current_webview().go_back();
		this.refresh_ui();
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
