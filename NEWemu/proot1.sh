
	echo -n "[###] Symlinking.... "
	while read p; do
		ln -s ${p/←/ }
	done <SYMLINKS.txt && rm SYMLINKS.txt
	echo Done
}

ARGS=proot
ARGS="$ARGS --kill-on-exit -r $TERMUX_SANDBOX_PATH $TERMUX_SANDBOX_PROOT_OPTIONS"

# Make sure that some common directory like /home is there.
# Otherwise, we recreate the directory
for dir in $TERMUX_SANDBOX_PATH/var/cache $TERMUX_SANDBOX_PATH/home $TERMUX_SANDBOX_PATH/sdcard; do
	! [ -d $dir ] && mkdir $dir
done

# Bind some common path
for bind in /dev /proc /sys /system /vendor /apex /linkerconfig/ld.config.txt /property_context $TERMUX_SANDBOX_PATH:$TERMUX_SANDBOX_APPPATH/usr $TERMUX_SANDBOX_PATH/var/cache:/data/data/com.termux/cache $TERMUX_SANDBOX_PATH/home:$TERMUX_SANDBOX_APPPATH/home; do
	[ -d $bind ] || [ -f $bind ] || echo $bind | grep com.termux > /dev/null && ARGS="$ARGS -b $bind"
done

ARGS="$ARGS -w $TERMUX_SANDBOX_APPPATH/home"
ARGS="$ARGS $TERMUX_SANDBOX_APPPATH/usr/bin/env -i"
ARGS="$ARGS HOME=$TERMUX_SANDBOX_APPPATH/home"
ARGS="$ARGS PATH=$TERMUX_SANDBOX_APPPATH/usr/bin"
ARGS="$ARGS TERM=${TERM:-xterm-256color}"
ARGS="$ARGS COLORTERM=${COLORTERM:-truecolor}"
ARGS="$ARGS ANDROID_DATA=/data"
ARGS="$ARGS ANDROID_ROOT=/system"
ARGS="$ARGS EXTERNAL_STORAGE=/sdcard"
ARGS="$ARGS LANG=${LANG:-en_US.UTF-8}"
ARGS="$ARGS LD_LIBRARY_PATH=$TERMUX_SANDBOX_APPPATH/usr/lib"
[ -x $TERMUX_SANDBOX_APPPATH/usr/lib/libtermux-exec.so ] && ARGS="$ARGS LD_PRELOAD=$TERMUX_SANDBOX_APPPATH/usr/lib/libtermux-exec.so"
ARGS="$ARGS TERMUX_VERSION=${TERMUX_VERSION:-0.118}"
ARGS="$ARGS PREFIX=$TERMUX_SANDBOX_APPPATH/usr"
ARGS="$ARGS TMPDIR=$TERMUX_SANDBOX_APPPATH/usr/tmp"
ARGS="$ARGS $TERMUX_SANDBOX_ENV"

cmd="$@"

# Unset Preload Library.
unset LD_PRELOAD

[ -z "$cmd" ] && exec $ARGS /bin/login
! [ -z "$cmd" ] && exec $ARGS /bin/login -c "$cmd"
