using Gtk;
using WebKit;

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
		notebook.show_all();
	}

	[GtkCallback]
	private void on_urlbar_activate(Entry entry) {
		stdout.printf("lele");
		//string url_address = entry.get_text();
		string url_address = "http://google.com";
		stdout.printf("%s", url_address);
		int tab_num = notebook.get_current_page();
		stdout.printf("tab num: %d", tab_num);
		ScrolledWindow scrolledwindow = notebook.get_nth_page(tab_num) as
		ScrolledWindow;
		stdout.printf("get scrolled window");
		WebView webview = scrolledwindow.get_child() as WebView;
		stdout.printf("get webview");
		webview.load_uri(url_address);
		stdout.printf("load uri");
	}
}
