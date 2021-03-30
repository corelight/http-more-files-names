
redef record HTTP::Info += {
	potential_fname: string &optional;
};

event http_request(c: connection, method: string, original_URI: string,
                   unescaped_URI: string, version: string) &priority=5
	{
	# Get rid of uri arguments
	local path = split_string(c$http$uri, /\?/)[0];
	local out = split_string(path, /\//);
	# Take the last component in the uri path
	c$http$potential_fname = out[|out|-1];
	}

event http_header(c: connection, is_orig: bool, name: string, value: string) &priority=3
	{
	if ( is_orig )
		return;

	if ( name == "ETAG" && /\"/ in value && c?$http && c$http?$current_entity)
		{
		if ( c$http?$potential_fname && c$http$potential_fname != "" )
			c$http$current_entity$filename = c$http$potential_fname;
		}
	}
