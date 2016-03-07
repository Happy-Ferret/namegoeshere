class PreferenceManager {

	static const string config_file_path = "namesgoeshere"
	static const string config_file_name = "config"

	public PreferenceManager() {
		string config_dir = Environment.get_user_config_dir();
		File config_file =
			File.new_for_path(config_dir)
				.get_child(self.config_file_path)
				.get_child(self.config_file_name);
		
	}



}
