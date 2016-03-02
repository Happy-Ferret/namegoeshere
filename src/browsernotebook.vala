using Gtk;
using WebKit;

public class BrowserNotebook: Notebook {

	public BrowserNotebook() {
		new_tab();
	}

	public void new_tab() {
		//ScrolledWindow scrolledwindow = new ScrolledWindow(null, null);
		//scrolledwindow.add(new WebView());
		WebView webview = new WebView();
		webview.connect("tile-changed", this.on_webview_title_changed);
		webview.connect("load-started", this.on_webview_load_started);
		webview.connect("load-finished", this.on_webview_load_finished);
		this.append_page(webview, new BrowserTabSign());
		this.show_all();
	}

	public ScrolledWindow get_current_scrolledwindow() {
		return this.get_nth_page(this.get_current_page()) as ScrolledWindow;
	}

	public WebView get_current_webview() {
		return this.get_nth_page(this.get_current_page()) as WebView;
	}
	
	private void on_webview_title_changed(WebView webview, Frame webframe,
										  string title) {
		BrowserTabSign tab_label = this.get_tab_label(webview) as BrowserTabSign;
		tab_label.set_title(title);
	}
		

	private void on_webview_load_started() {
	}

	private void on_webview_load_finished() {
	}

}
