template:
	cp ./simple_template.md ./_posts/tmp1.md
	# sed -i '' 's#code.byted.org/videoarch/pcdn_live/thrift_gen/toutiao/videoarch/pcdn_live#code.byted.org/overpass/toutiao_videoarch_pcdn_live/kitex_gen/toutiao/videoarch/pcdn_live#g' phone_p2p/*
	sed -i .bak "s/YYYY-MM-DD/$(shell date '+%Y-%m-%d')/g" _posts/tmp1.md
	rm _posts/tmp1.md.bak

