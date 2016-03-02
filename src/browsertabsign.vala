using Gtk;

static const string ICON_TAB = "applications_internet";
static const string ICON_CLOSE = "window-close";
static const string LABEL_TAB = "New tab";

public class BrowserTabSign: Box {

    public BrowserTabSign() {
        this.pack_start(new Image.from_icon_name(ICON_TAB, IconSize.SMALL_TOOLBAR), true, true);
        this.pack_start(new Label(LABEL_TAB), true, true);
        this.pack_start(new Button.from_icon_name(ICON_CLOSE,
IconSize.SMALL_TOOLBAR), true, true);
    }

}
        
