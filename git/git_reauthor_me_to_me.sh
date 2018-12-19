 git filter-branch -f --commit-filter '
        if [ "$GIT_AUTHOR_EMAIL" = "Peter Meißner" ];
        then
                GIT_AUTHOR_NAME="petermeissner";
                GIT_AUTHOR_EMAIL="retep.meissner@gmail.com";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi' HEAD
        
 git filter-branch -f --commit-filter '
        if [ "$GIT_AUTHOR_EMAIL" = "retep.meissner@gmail.com" ];
        then
                GIT_AUTHOR_NAME="petermeissner";
                GIT_AUTHOR_EMAIL="retep.meissner@gmail.com";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi' HEAD        
