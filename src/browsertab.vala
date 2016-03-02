using Gtk;
using WebKit;

public class BrowserTab: ScrolledWindow {
 
    public BrowserTab() {
		this.add(new WebView());
    }

	public WebView get_webview() {
		return this.get_child() as WebView;
	}
}
   
