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
		box.pack_start(this.browsernotebook, true, true, 0);
		stdout.printf("haha\n");
		this.show_all();
	}

	[GtkCallback]
	private void on_btn_newtab_clicked(ToolButton toolbutton) {
		browsernotebook.new_tab();
	}

	[GtkCallback]
	private void on_urlbar_activate(Entry entry) {
		string uri = browsernotebook.http_autocorrect(entry.get_text());
		WebView webview = browsernotebook.get_current_webview();
		webview.load_uri(uri);
		this.refresh_ui(webview);
	}

	public void refresh_ui(Widget page) {
		// TODO: find more fitting name
		WebView webview = page as WebView;
		string uri = webview.get_uri();
		if (uri != null) {
			this.set_entry_text(uri);
		} else {
			this.set_entry_text("");
		}
		if (webview.can_go_back()) {
			btn_back.set_sensitive(true);
		} else {
			btn_back.set_sensitive(false);
		}
		if (webview.can_go_forward()) {
			btn_forward.set_sensitive(true);
		} else {
			btn_back.set_sensitive(false);
		}
	}

	[GtkCallback]
	private void on_btn_back_clicked(ToolButton toolbutton) {
		WebView webview = browsernotebook.get_current_webview();
		webview.go_back();
		this.refresh_ui(webview);
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
