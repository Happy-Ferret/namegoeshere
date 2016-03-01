using Gtk;

public class NameGoesHere: Gtk.Application {

	public static const string APP_NAME = "NameGoesHere";
	public static const string APP_SUMMARY = "replace this later";
	public static const string APP_VERSION = "thx stev jobs";

	//private string default_theme = "dank";

	public NameGoesHere() {
		// https://wiki.gnome.org/HowDoI/GtkApplication
		// http://www.valadoc.org/#!api=gtk+-3.0/Gtk.ApplicationWindow
		Object (application_id: "de.uni-frankfurt.namegoeshere",
				flags: ApplicationFlags.FLAGS_NONE);
	}

	protected override void activate() {
		new BrowserWindow(this);
	}
}

public static int main(string[] args) {
	return new NameGoesHere().run(args);
}
