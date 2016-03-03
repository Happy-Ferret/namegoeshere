using Gtk;
using WebKit;

public class BrowserNotebook: Notebook {

	public BrowserNotebook() {
		new_tab();
	}

	public void new_tab() {
		WebView webview = new WebView();
		webview.load_changed.connect(this.on_webview_load_changed);
		this.append_page(webview, new BrowserTabSign());
		this.show_all();
	}

	public ScrolledWindow get_current_scrolledwindow() {
		return this.get_nth_page(this.get_current_page()) as ScrolledWindow;
	}

	public WebView get_current_webview() {
		return this.get_nth_page(this.get_current_page()) as WebView;
	}
	
	private void on_webview_load_changed(LoadEvent loadevent) {
		switch (loadevent) {
			case LoadEvent.STARTED:
				stdout.printf("started\n");
				break;
			case LoadEvent.REDIRECTED:
				stdout.printf("redirected\n");
				break;
			case LoadEvent.COMMITTED:
				stdout.printf("committed\n");
				break;
			case LoadEvent.FINISHED:
				stdout.printf("finished\n");
				break;
		}
	}
}
