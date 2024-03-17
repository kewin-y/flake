{ ... }: 

{
	programs.foot = {
		enable = true;
		settings = {
			main = {
				font = "Iosevka NF:size=10.5";
				box-drawings-uses-font-glyphs = "no";
				pad = "16x16";
			};

			cursor =  {
				color = "111516 c2c4c2";
			};

			colors = {
				regular0="111115";
				regular1="a54242";
				regular2="6a9440";
				regular3="d08666";
				regular4="576d9f";
				regular5="766991";
				regular6="5a7d82";
				regular7="6a727a";

				bright0="717171";
				bright1="cc6666";
				bright2="98bd68";
				bright3="e7ae77";
				bright4="8aaece";
				bright5="ac8eb6";
				bright6="76acad";
				bright7="a2abae";

				foreground="c2c4c2";
				background="111517";
			};
		};
	};
}
