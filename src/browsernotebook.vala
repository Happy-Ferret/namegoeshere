using Gtk;

public class BrowserNotebook: Notebook {

	public BrowserNotebook() {
		new_tab();
	}

	public void new_tab() {
		ScrolledWindow scrolledwindow = new ScrolledWindow(null, null);
		scrolledwindow.add(new WebKit.WebView());
		this.append_page(scrolledwindow, new BrowserTabSign());
	}

	public ScrolledWindow get_current_scrolledwindow() {
		return this.get_nth_page(this.get_current_page()) as ScrolledWindow;
	}

	public WebKit.WebView get_current_webview() {
		return this.get_current_scrolledwindow().get_child() as WebKit.WebView;
	}

}
