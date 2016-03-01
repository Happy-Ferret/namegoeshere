using Gtk;

static const ICON_TAB = "applications_internet"
static const ICON_CLOSE = "window-close"
static const LABEL_TAB = "New tab"

class BrowserTabSign: Box {
    BrowserTabSign() {
        this.pack_start(new Image.from_icon_name(ICON_TAB, IconSize.SMALL_TOOLBAR), true, true);
        this.pack_start(new Label(LABEL_TAB), true, true);
        this.pack_start(new Button.from_icon_name(ICON_CLOSE,
IconSize.SMALL_TOOLBAR), true, true);
    }
}
        
