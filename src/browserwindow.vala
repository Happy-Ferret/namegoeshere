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
		new PreferenceManager();
		Box box = this.get_child() as Box;
		box.pack_start(this.browsernotebook, true, true, 0);
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
		this.set_entry_text(uri);
		btn_back.set_sensitive(webview.can_go_back());
		btn_forward.set_sensitive(webview.can_go_forward());
	}

	[GtkCallback]
	private void on_btn_back_clicked(ToolButton toolbutton) {
		WebView webview = browsernotebook.get_current_webview();
		webview.go_back();
	}

	[GtkCallback]
	private void on_btn_forward_clicked(ToolButton toolbutton) {
		WebView webview = browsernotebook.get_current_webview();
		webview.go_forward();
	}

	public void set_entry_text(string? text) {
		// if text == null pass "", else pass text
		urlbar.set_text(text ?? "");
	}

}
