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

	public ScrolledWindow get_scrolledwindow(int? index) {
		if (index == null) {
			return this.get_nth_page(this.get_current_page()) as ScrolledWindow;
		}
		else {
			return this.get_nth_page(index) as ScrolledWindow;
		}
	}

	public WebKit.WebView get_webview(int? index = null) {
		return this.get_scrolledwindow(index).get_child() as WebKit.WebView;
	}

}
