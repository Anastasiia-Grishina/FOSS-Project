install: channel_choice_gui_nw-ru.mo
	install channel_choice channel_choice_tui channel_choice_gui_nw /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat channel_choice.services`" /etc/services || cat channel_choice.services >> /etc/services
	install channel_choice.xinetd /etc/xinetd.d/channel_choice
	ln -sf /usr/local/bin/channel_choice_gui_nw /usr/local/bin/channel_choice_gui
	ln -sf /usr/local/bin/channel_choice_gui_nw /usr/local/bin/channel_choice_nw
	install channel_choice_gui_nw-ru.mo /usr/share/locale/ru/LC_MESSAGES/channel_choice_gui_nw.mo

channel_choice_gui_nw.pot: channel_choice_gui_nw
	xgettext -o channel_choice_gui_nw.pot -L Shell channel_choice_gui_nw

channel_choice_gui_nw-ru.mo: channel_choice_gui_nw-ru.po
	msgfmt -o channel_choice_gui_nw-ru.mo channel_choice_gui_nw-ru.po

clone:
	git clone https://github.com/Anastasiia-Grishina/FOSS-Project.git

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

tags:
	git push origin --tags
