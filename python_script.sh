








if __name__ == "__main__":
    type = sys.argv[1]
    if type == 'dw':
	#set type to dw==diferent workspace: your blog (jekyll server) work space different from git workspace;
	#such as your jekyll build '_site' dir equals to ~/blog/jekyll/www/_site/ , git(master) dir equals to ~/blog/git/{yourname}.github.io/
	#so use {dw}.
	echo "im dw mode"
        
	#set_mysql_root(sys.argv[2])
    elif type == 'sw':
	#contrary to the above
	echo "im sw mode"

    else:
        print('ERROR: Parameter error;Usage:bash main.sh [dw/sw] your work space')
