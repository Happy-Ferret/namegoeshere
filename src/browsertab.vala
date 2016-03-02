using Gtk;
using WebKit;

public class BrowserTab: Box {
 
    public BrowserTab() {
        ScrolledWindow scrolled_window = new ScrolledWindow(null, null);
        this.pack_start(scrolled_window, true, true, 0);
        
        WebView web_view = new WebView();
        scrolled_window.add(web_view); 
    }
}
   
