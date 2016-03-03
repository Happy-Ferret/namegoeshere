using Gtk;
using WebKit;

[GtkTemplate (ui = "/de/uni-frankfurt/namegoeshere/ui/browserwindow.ui")]
public class BrowserWindow: ApplicationWindow {

	//[GtkChild] BrowserNotebook notebook;
	[GtkChild] Entry urlbar;
	[GtkChild] ToolButton btn_forward;
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
		browsernotebook.get_current_webview().load_uri(entry.get_text());
	}

	[GtkCallback]
	private void on_btn_back_clicked(ToolButton toolbutton) {
		browsernotebook.get_current_webview().go_back();
	}

	[GtkCallback]
	private void on_btn_forward_clicked(ToolButton toolbutton) {
		browsernotebook.get_current_webview().go_forward();
	}

	public void set_entry_text(string text) {
		urlbar.set_text(text);
	}

}
