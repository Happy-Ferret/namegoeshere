using Gtk;
using WebKit;

public class BrowserNotebook: Notebook {
	
	private BrowserWindow browserwindow;

	public BrowserNotebook(BrowserWindow browserwindow) {
		this.change_current_page.connect(this.on_current_page_changed);
		this.browserwindow = browserwindow;
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
				//BrowserTabSign tab_label = this.get_tab_label(webview) as BrowserTabSign;
				//tab_label.set_title(title);
				break;
		}
	}
	
	private void on_current_page_changed(int index) {
		WebView webview = this.get_nth_page(index) as WebView;
		string title = webview.get_title();
		this.browserwindow.set_title(title);
	}
}
