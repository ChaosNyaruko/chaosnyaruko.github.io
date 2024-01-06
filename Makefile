TITLE := your-title
DATE := $(shell date '+%Y-%m-%d')
NAME := $(DATE)-$(TITLE)
template:
	cp ./simple_template.md ./_posts/$(NAME).md
	# sed -i '' 's#github.com/ChaosNyaruko/xxxx#github.com/ChaosNyaruko/yyy#g' clash/*
	sed -i .bak "s/YYYY-MM-DD/$(DATE)/g" _posts/$(NAME).md
	# mv _posts/tmp1.md _posts/$(shell date '+%Y-%m-%d')-$(TITLE).md
	rm _posts/$(NAME).md.bak

repost:
	TITLE = $(shell read -p "Enter: " enter ; echo $${enter})
	NAME = $(DATE)-$(TITLE)
	cp ./simple_template.md ./_posts/$(NAME).md
	# sed -i '' 's#github.com/ChaosNyaruko/xxxx#github.com/ChaosNyaruko/yyy#g' clash/*
	sed -i .bak "s/YYYY-MM-DD/$(DATE)/g" _posts/$(NAME).md
	# mv _posts/tmp1.md _posts/$(shell date '+%Y-%m-%d')-$(TITLE).md
	rm _posts/$(NAME).md.bak


rename:
	mv _posts/$(DATE)-your-title.md _posts/$(DATE)-$(TITLE).md

serve:
	bundle exec jekyll serve --livereload --port 4000 --host 0.0.0.0
