using Gtk;
using WebKit;

public class BrowserNotebook: Notebook {

	public BrowserNotebook() {
		new_tab();
	}

	public void new_tab() {
		//ScrolledWindow scrolledwindow = new ScrolledWindow(null, null);
		//scrolledwindow.add(new WebView());
		this.append_page(new WebView(), new BrowserTabSign());
		this.show_all();
	}

	public ScrolledWindow get_current_scrolledwindow() {
		return this.get_nth_page(this.get_current_page()) as ScrolledWindow;
	}

	public WebView get_current_webview() {
		return this.get_nth_page(this.get_current_page()) as WebView;
	}

}
