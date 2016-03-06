using Gtk;

static const string ICON_TAB = "applications-internet";
static const string ICON_CLOSE = "window-close";
static const string LABEL_TAB = "New tab";

public class BrowserTabSign: Box {

	private Image favicon;
	private Label title;
	private Button closebutton;
	private BrowserNotebook browsernotebook;

    public BrowserTabSign(BrowserNotebook browsernotebook) {
		this.browsernotebook = browsernotebook;

		favicon = new Image.from_icon_name(ICON_TAB, IconSize.SMALL_TOOLBAR);
		title = new Label(LABEL_TAB);
		closebutton = new Button.from_icon_name(ICON_CLOSE,
												IconSize.SMALL_TOOLBAR);
        this.pack_start(favicon, false, false, 0);
        this.pack_start(title, true, true, 0);
        this.pack_start(closebutton, false, false, 0);
		this.closebutton.clicked.connect(this.on_closebutton_clicked);
		this.show_all();
    }

	public void set_label_text(string text) {
		this.title.set_text(text);
	}

	public void on_closebutton_clicked() {
		browsernotebook.remove_tab(this);
	}
}
        
