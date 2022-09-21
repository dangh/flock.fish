function flock -d "obtain exclusive lock for a file"
  argparse -i -s e x/exclusive s/shared o/close n/nb nonblock w= timeout E/conflict-exit-code= u/unlock verbose -- $argv
  set -l f $argv[1]
  set -l cmd $argv[2..]
  if set -q _flag_unlock
    mv $f.lock $f.deleteme && rm $f.deleteme
  else
    if test -n "$cmd"
      # lock, execute, unlock
      if ln -s $f $f.lock
        $cmd
        mv $f.lock $f.deleteme && rm $f.deleteme
      end
    else
      # lock and return status
      ln -s $f $f.lock
    end
  end
end
